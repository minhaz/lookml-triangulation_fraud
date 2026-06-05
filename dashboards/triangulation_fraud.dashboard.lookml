- dashboard: triangulation_fraud_dashboard
  title: "Triangulation Fraud Analysis"
  layout: newspaper
  elements:
    - name: "Fraud Network View"
      title: "Triangulation Fraud Network"
      type: "triangulation_fraud::triangulation_network_viz"
      model: triangulation_fraud
      explore: triangulation_fraud
      dimensions: [
        order.order_id,
        merchant_storefront.storefront_id,
        shipping_address.shipping_id,
        credit_card.card_id,
        cardholder.cardholder_id,
        chargeback.chargeback_id
      ]
      measures: []
      listen: {}
      row: 0
      col: 0
      width: 24
      height: 12
