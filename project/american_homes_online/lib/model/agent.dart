class Agent {
  final dynamic profile_img;
  final String title;
  final String mobile;
  final dynamic  total;
  final int agent_id;

  Agent({this.profile_img, this.title, this.mobile, this.total, this.agent_id});

  factory Agent.fromJson(Map<String, dynamic> json) {
    return new Agent(
      profile_img: json['profile_img'],
      title: json['title'],
      mobile: json['mobile'],
      total: json['total'],
      agent_id: json['agent_id'],
    );
  }
}
