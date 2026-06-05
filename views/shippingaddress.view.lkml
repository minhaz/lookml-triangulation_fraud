view: shippingaddress {
  sql_analytic_model_name: triangulation_fraud_demo ;;

  dimension: shipping_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.shipping_id ;;
  }

  dimension: recipient_name {
    type: string
    sql: ${TABLE}.recipient_name ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip_code {
    type: string
    sql: ${TABLE}.zip_code ;;
  }

  measure: count {
    type: count
  }
}
