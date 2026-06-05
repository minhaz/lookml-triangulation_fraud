looker.plugins.visualizations.add({
  options: {
    color_order: {
      type: "string",
      label: "Order Node Color",
      display: "color",
      default: "#1a73e8"
    },
    color_merchant: {
      type: "string",
      label: "Merchant Node Color",
      display: "color",
      default: "#ea4335"
    },
    color_attribute: {
      type: "string",
      label: "Shared Attribute Node Color",
      display: "color",
      default: "#fbbc05"
    }
  },

  create: function(element, config) {
    element.innerHTML = `
      <style>
        .looker-custom-vis-container {
          width: 100%;
          height: 100%;
          box-sizing: border-box;
          font-family: 'Open Sans', 'Helvetica', Arial, sans-serif;
          overflow: hidden;
        }
      </style>
      <div id="vis-container" class="looker-custom-vis-container"></div>
    `;
    this.container = element.querySelector("#vis-container");
    this.chart = null;
  },

  loadScript: function(url, callback) {
    var scriptId = "lib_" + url.replace(/[^a-zA-Z0-9]/g, "_");
    if (document.getElementById(scriptId)) {
      if (window[scriptId + "_loaded"]) {
        callback();
      } else {
        window.addEventListener(scriptId + "_done", callback);
      }
      return;
    }

    var script = document.createElement("script");
    script.id = scriptId;
    script.src = url;
    script.onload = () => {
      window[scriptId + "_loaded"] = true;
      callback();
      window.dispatchEvent(new Event(scriptId + "_done"));
    };
    document.head.appendChild(script);
  },

  updateAsync: function(data, element, config, queryResponse, details, done) {
    this.clearErrors();

    if (queryResponse.fields.dimensions.length < 2) {
      this.addError({
        title: "Dimensions Required",
        message: "Requires at least 2 dimensions: Order, Merchant. An optional 3rd dimension can be used for Shared Attributes."
      });
      done();
      return;
    }

    const dimOrder = queryResponse.fields.dimensions[0].name;
    const dimMerchant = queryResponse.fields.dimensions[1].name;
    const dimAttribute = queryResponse.fields.dimensions.length > 2 ? queryResponse.fields.dimensions[2].name : null;

    // Load ECharts from CDN
    this.loadScript("https://cdn.jsdelivr.net/npm/echarts@5.5.0/dist/echarts.min.js", () => {
      if (!this.chart) {
        this.chart = window.echarts.init(this.container);
      }

      const nodesMap = new Map();
      const edges = [];

      const addNode = (id, name, category, value = 10) => {
        if (!id || id === "null" || id === "undefined") return;
        if (!nodesMap.has(id)) {
          nodesMap.set(id, { id: id, name: name, category: category, symbolSize: value, value: value });
        } else {
          const existing = nodesMap.get(id);
          existing.symbolSize = Math.min(existing.symbolSize + 2, 50);
          existing.value += 1;
        }
      };

      data.forEach(row => {
        const orderVal = row[dimOrder].value;
        const merchantVal = row[dimMerchant].value;
        
        let orderLabel = LookerCharts.Utils.textForCell(row[dimOrder]);
        let merchantLabel = LookerCharts.Utils.textForCell(row[dimMerchant]);

        if (orderVal == null || merchantVal == null) return;
        
        const orderNodeId = "order_" + orderVal;
        const merchantNodeId = "merchant_" + merchantVal;

        addNode(orderNodeId, orderLabel, 0, 15);
        addNode(merchantNodeId, merchantLabel, 1, 20);

        edges.push({
          source: orderNodeId,
          target: merchantNodeId
        });

        if (dimAttribute) {
          const attrVal = row[dimAttribute].value;
          if (attrVal != null && attrVal !== "") {
            const attrLabel = LookerCharts.Utils.textForCell(row[dimAttribute]);
            const attrNodeId = "attr_" + attrVal;
            addNode(attrNodeId, attrLabel, 2, 18);
            edges.push({
              source: orderNodeId,
              target: attrNodeId
            });
          }
        }
      });

      const nodes = Array.from(nodesMap.values());

      const option = {
        title: {
          text: config.chart_title || '',
          left: 'center'
        },
        tooltip: {
          show: true,
          formatter: function(params) {
            if (params.dataType === 'node') {
              let type = '';
              if (params.data.category === 0) type = 'Order';
              if (params.data.category === 1) type = 'Merchant';
              if (params.data.category === 2) type = 'Shared Attribute';
              return `<strong>${type}</strong><br/>${params.data.name}<br/>Degree: ${params.data.value}`;
            }
            return '';
          }
        },
        legend: [{
          data: ['Order', 'Merchant', 'Shared Attribute'],
          bottom: 10
        }],
        series: [
          {
            type: 'graph',
            layout: 'force',
            data: nodes,
            links: edges,
            categories: [
              { name: 'Order', itemStyle: { color: config.color_order || "#1a73e8" } },
              { name: 'Merchant', itemStyle: { color: config.color_merchant || "#ea4335" } },
              { name: 'Shared Attribute', itemStyle: { color: config.color_attribute || "#fbbc05" } }
            ],
            roam: true,
            label: {
              show: true,
              position: 'right',
              formatter: '{b}'
            },
            force: {
              repulsion: 250,
              edgeLength: 80
            },
            lineStyle: {
              color: 'source',
              curveness: 0.2,
              opacity: 0.7
            }
          }
        ]
      };

      if (details.crossfilterEnabled) {
        this.chart.off('click');
        this.chart.on('click', (params) => {
          if (params.dataType === 'node' && params.data.category === 0) {
            const targetRow = data.find(r => ("order_" + r[dimOrder].value) === params.data.id);
            if (targetRow) {
               LookerCharts.Utils.toggleCrossfilter({
                  row: targetRow,
                  event: params.event.event
               });
            }
          }
        });
      }

      this.chart.setOption(option);
      
      if (this._resizeHandler) {
          window.removeEventListener('resize', this._resizeHandler);
      }
      this._resizeHandler = () => this.chart.resize();
      window.addEventListener('resize', this._resizeHandler);

      done();
    });
  }
});
