view: merchantstorefront {
  sql_analytic_model_name: triangulation_fraud_demo ;;

  dimension: storefront_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.storefront_id ;;
  }

  dimension: platform_name {
    type: string
    sql: ${TABLE}.platform_name ;;
  }

  dimension: seller_rating {
    type: number
    sql: ${TABLE}.seller_rating ;;
  }

  dimension: creation_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.creation_date ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: complaint_rate {
    type: number
    sql: ${TABLE}.complaint_rate ;;
  }

  measure: count {
    type: count
  }
}
