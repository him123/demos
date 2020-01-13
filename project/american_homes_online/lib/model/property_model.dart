import 'dart:convert';

class PropertyModel {
  String user_id = '';
  String property_title = '';
  String property_description = '';
  String property_price = '';
  String prop_category = '';
  String prop_action_category = '';
  String property_status = '';
  String property_taxes = '';
  String property_maintenance = '';

  String attached = '';
  String attachid='';
  String attachthumb = '';
  String embed_video_type = '';
  String embed_video_id = '';
  String embed_virtual_tour = '';

  String property_address = '';
  String property_county = '';
  String property_city = '';
  String property_area = '';
  String property_zip = '';
  String property_country = '';
  String google_camera_angle = '';
  String property_google_view = '';
  String property_latitude = '';
  String property_longitude = '';

  String property_size = '';
  String property_lot_size = '';
  String property_rooms = '';
  String property_bedrooms = '';
  String property_bathrooms = '';
  String property_year = '';
  String property_garage = '';
  String property_garage_size = '';
  String property_date = '';
  String property_basement = '';
  String property_external_construction = '';
  String exterior_material = '';
  String property_roofing = '';
  String stories_number = '';
  String owner_notes = '';

  PropertyModel(
      {this.user_id,
      this.property_title,
      this.property_description,
      this.property_price,
      this.prop_category,
      this.prop_action_category,
      this.property_status,
      this.property_taxes,
      this.property_maintenance,
      this.attached,
        this.attachid,
      this.attachthumb,
      this.embed_video_type,
      this.embed_video_id,
      this.embed_virtual_tour,
      this.property_address,
      this.property_county,
      this.property_city,
      this.property_area,
      this.property_zip,
      this.property_country,
      this.google_camera_angle,
      this.property_google_view,
      this.property_latitude,
      this.property_longitude,
      this.property_size,
      this.property_lot_size,
      this.property_rooms,
      this.property_bedrooms,
      this.property_bathrooms,
      this.property_year,
      this.property_garage,
      this.property_garage_size,
      this.property_date,
      this.property_basement,
      this.property_external_construction,
      this.exterior_material,
      this.property_roofing,
      this.stories_number,
      this.owner_notes});

  PropertyModel clientFromJson(String str) {
    final jsonData = json.decode(str);
    return PropertyModel.fromMap(jsonData);
  }

  String clientToJson(PropertyModel data) {
    final dyn = data.toMap();
    return json.encode(dyn);
  }

  factory PropertyModel.fromMap(Map<String, dynamic> json) => new PropertyModel(
        user_id: json["user_id"],
        property_title: json["property_title"],
        property_description: json["property_description"],
        property_price: json["property_price"],
        prop_category: json["prop_category"],
        prop_action_category: json["prop_action_category"],
        property_status: json["property_status"],
        property_taxes: json["property_taxes"],
        property_maintenance: json["property_maintenance"],
        attached: json["attached"],
    attachid: json["attachid"],
        attachthumb: json["attachthumb"],
        embed_video_type: json["embed_video_type "],
        embed_video_id: json["embed_video_id"],
        embed_virtual_tour: json["embed_virtual_tour"],
        property_address: json["property_address"],
        property_county: json["property_county"],
        property_city: json["property_city"],
        property_area: json["property_area"],
        property_zip: json["property_zip"],
        property_country: json["property_country"],
        google_camera_angle: json["google_camera_angle"],
        property_google_view: json["property_google_view"],
        property_latitude: json["property_latitude"],
        property_longitude: json["property_longitude"],
        property_size: json["property_size"],
        property_lot_size: json["property_lot_size"],
        property_rooms: json["property_rooms"],
        property_bedrooms: json["property_bedrooms"],
        property_bathrooms: json["property_bathrooms"],
        property_year: json["property_year"],
        property_garage: json["property_garage"],
        property_garage_size: json["property_garage_size"],
        property_date: json["property_date"],
        property_basement: json["property_basement"],
        property_external_construction: json["property_external_construction"],
        exterior_material: json["exterior_material"],
        property_roofing: json["property_roofing"],
        stories_number: json["stories_number"],
        owner_notes: json["owner_notes"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": user_id,
        "property_title": property_title,
        "property_description": property_description,
        "property_price": property_price,
        "prop_category": prop_category,
        "prop_action_category": prop_action_category,
        "property_status": property_status,
        "property_taxes": property_taxes,
        "property_maintenance": property_maintenance,
        "attached": attached,
        "attachid": attachid ,
        "attachthumb": attachthumb,
        "embed_video_type": embed_video_type,
        "embed_video_id": embed_video_id,
        "embed_virtual_tour": embed_virtual_tour,
        "property_address": property_address,
        "property_county": property_county,
        "property_city": property_city,
        "property_area": property_area,
        "property_zip": property_zip,
        "property_country": property_country,
        "google_camera_angle": google_camera_angle,
        "property_google_view": property_google_view,
        "property_latitude": property_latitude,
        "property_longitude": property_longitude,
        "property_size": property_size,
        "property_lot_size": property_lot_size,
        "property_rooms": property_rooms,
        "property_bedrooms": property_bedrooms,
        "property_bathrooms": property_bathrooms,
        "property_year": property_year,
        "property_garage": property_garage,
        "property_garage_size": property_garage_size,
        "property_date": property_date,
        "property_basement": property_basement,
        "property_external_construction": property_external_construction,
        "exterior_material": exterior_material,
        "property_roofing": property_roofing,
        "stories_number": stories_number,
        "owner_notes": owner_notes,
      };
}
