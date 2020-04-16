module HomeHelper
  BADGES = {
    mobile: {
      title: I18n.t("home.index.mobile_badge"),
      icon_class: "fa-walking",
      theme: "badge-primary",
    },
    remote: {
      title: I18n.t("home.index.remote_badge"),
      icon_class: "fa-laptop",
      theme: "badge-success",
    },
    requires_credentials: {
      title: I18n.t("home.index.requires_credentials_badge"),
      icon_class: "fa-graduation-cap",
      theme: "badge-dark",
    },
    requires_immunity: {
      title: I18n.t("home.index.requires_immunity_badge"),
      icon_class: "fa-shield-virus",
      theme: "badge-danger",
    },
    at_hospitals: {
      title: I18n.t("home.index.at_hospitals_badge"),
      icon_class: "fa-h-square",
      theme: "badge-info",
    },
    coming_soon: {
      title: I18n.t("home.index.coming_soon_badge"),
      theme: "badge-secondary",
    },
  }.freeze
end
