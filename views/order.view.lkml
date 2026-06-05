view: order {
  sql_table_name: `triangulation_fraud_demo.Order` ;;
  sql_analytic_model_name: triangulation_fraud_demo ;;

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }
  dimension_group: order_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.order_date ;;
  }
  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }
  dimension: shipping_method {
    type: string
    sql: ${TABLE}.shipping_method ;;
  }
  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status ;;
  }
  dimension: items_count {
    type: number
    sql: ${TABLE}.items_count ;;
  }
}
