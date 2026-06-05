view: triangulation_fraud {
  sql_analytic_model_name: next26boothdemo.triangulation_fraud_demo.triangulation_fraud_graph ;;

  # order
  dimension: order_order_id {
    primary_key: yes
    type: string
    sql: order.order_id ;;
  }
  dimension_group: order_order_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: order.order_date ;;
  }
  dimension: order_total_amount {
    type: number
    sql: order.total_amount ;;
  }
  dimension: order_shipping_method {
    type: string
    sql: order.shipping_method ;;
  }
  dimension: order_order_status {
    type: string
    sql: order.order_status ;;
  }
  dimension: order_items_count {
    type: number
    sql: order.items_count ;;
  }

  # merchant_storefront
  dimension: merchant_storefront_storefront_id {
    type: string
    sql: merchant_storefront.storefront_id ;;
  }
  dimension: merchant_storefront_platform_name {
    type: string
    sql: merchant_storefront.platform_name ;;
  }
  dimension: merchant_storefront_seller_rating {
    type: number
    sql: merchant_storefront.seller_rating ;;
  }
  dimension_group: merchant_storefront_creation_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: merchant_storefront.creation_date ;;
  }
  dimension: merchant_storefront_category {
    type: string
    sql: merchant_storefront.category ;;
  }
  dimension: merchant_storefront_complaint_rate {
    type: number
    sql: merchant_storefront.complaint_rate ;;
  }

  # chargeback
  dimension: chargeback_chargeback_id {
    type: string
    sql: chargeback.chargeback_id ;;
  }
  dimension: chargeback_reason_code {
    type: string
    sql: chargeback.reason_code ;;
  }
  dimension: chargeback_amount {
    type: number
    sql: chargeback.amount ;;
  }
  dimension_group: chargeback_dispute_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: chargeback.dispute_date ;;
  }
  dimension: chargeback_resolution_status {
    type: string
    sql: chargeback.resolution_status ;;
  }
  dimension: chargeback_win_probability {
    type: number
    sql: chargeback.win_probability ;;
  }

  # credit_card
  dimension: credit_card_card_id {
    type: string
    sql: credit_card.card_id ;;
  }
  dimension: credit_card_bin {
    type: string
    sql: credit_card.bin ;;
  }
  dimension_group: credit_card_expiration_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: credit_card.expiration_date ;;
  }
  dimension: credit_card_card_type {
    type: string
    sql: credit_card.card_type ;;
  }
  dimension: credit_card_issuing_bank {
    type: string
    sql: credit_card.issuing_bank ;;
  }
  dimension: credit_card_is_compromised {
    type: yesno
    sql: credit_card.is_compromised ;;
  }

  # cardholder
  dimension: cardholder_cardholder_id {
    type: string
    sql: cardholder.cardholder_id ;;
  }
  dimension: cardholder_name {
    type: string
    sql: cardholder.name ;;
  }
  dimension: cardholder_risk_segment {
    type: string
    sql: cardholder.risk_segment ;;
  }
  dimension: cardholder_lifetime_value {
    type: number
    sql: cardholder.lifetime_value ;;
  }
  dimension: cardholder_status {
    type: string
    sql: cardholder.status ;;
  }
  dimension: cardholder_tenure_months {
    type: number
    sql: cardholder.tenure_months ;;
  }
  dimension: cardholder_billing_zip_code {
    type: string
    sql: cardholder.billing_zip_code ;;
  }

  # shipping_address
  dimension: shipping_address_shipping_id {
    type: string
    sql: shipping_address.shipping_id ;;
  }
  dimension: shipping_address_recipient_name {
    type: string
    sql: shipping_address.recipient_name ;;
  }
  dimension: shipping_address_street {
    type: string
    sql: shipping_address.street ;;
  }
  dimension: shipping_address_city {
    type: string
    sql: shipping_address.city ;;
  }
  dimension: shipping_address_state {
    type: string
    sql: shipping_address.state ;;
  }
  dimension: shipping_address_zip_code {
    type: string
    sql: shipping_address.zip_code ;;
  }

}
