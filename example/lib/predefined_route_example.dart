const predefinedRouteExample = {
  "distance": 1592.009,
  "duration": 297.157,
  "weight": 437.218,
  "weight_name": "auto",
  "legs": [
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 58.336,
      "duration": 39.318,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You will arrive at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You will arrive at your destination"
              },
              "distanceAlongGeometry": 238.43
            },
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 69.444
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive northeast on <say-as interpret-as=\"address\">Via Giovanni Pacini</say-as>. Then, in 800 feet, You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive northeast on Via Giovanni Pacini. Then, in 800 feet, You will arrive at your destination.",
              "distanceAlongGeometry": 238.43
            },
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">You have arrived at your destination.</prosody></amazon:effect></speak>",
              "announcement": "You have arrived at your destination.",
              "distanceAlongGeometry": 69.444
            }
          ],
          "intersections": [
            {
              "entry": [true],
              "bearings": [64],
              "duration": 6.353,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 7.465,
              "geometry_index": 0,
              "location": [9.225944, 45.48102]
            },
            {
              "entry": [true, true, false],
              "in": 2,
              "bearings": [63, 125, 244],
              "duration": 2.944,
              "turn_weight": 0.75,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 4.187,
              "geometry_index": 1,
              "location": [9.226286, 45.481139]
            },
            {
              "entry": [true, false, false, false],
              "in": 2,
              "bearings": [64, 176, 243, 358],
              "duration": 1.594,
              "turn_weight": 1.5,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 3.351,
              "geometry_index": 2,
              "location": [9.226431, 45.48119]
            },
            {
              "entry": [true, false],
              "in": 1,
              "bearings": [63, 244],
              "duration": 0.072,
              "turn_weight": 0.75,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 0.835,
              "geometry_index": 3,
              "location": [9.226515, 45.481219]
            },
            {
              "mapbox_streets_v8": {"class": "tertiary"},
              "location": [9.226526, 45.481223],
              "geometry_index": 4,
              "admin_index": 0,
              "weight": 5.93,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.019,
              "turn_weight": 4.2,
              "duration": 3.492,
              "bearings": [64, 179, 243, 358],
              "out": 0,
              "in": 2,
              "entry": [true, true, false, true]
            },
            {
              "entry": [true, false, false, false],
              "in": 2,
              "bearings": [64, 179, 244, 359],
              "duration": 1.165,
              "turn_weight": 1.5,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 2.846,
              "geometry_index": 5,
              "location": [9.226629, 45.481259]
            },
            {
              "entry": [true, false, false],
              "in": 2,
              "bearings": [64, 179, 244],
              "duration": 12.019,
              "turn_weight": 0.75,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 14.85,
              "geometry_index": 6,
              "location": [9.226713, 45.481288]
            },
            {
              "entry": [true, false, false],
              "in": 2,
              "bearings": [64, 121, 244],
              "duration": 1.486,
              "turn_weight": 0.75,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 2.473,
              "geometry_index": 7,
              "location": [9.227751, 45.48165]
            },
            {
              "entry": [true, false, false, false],
              "in": 2,
              "bearings": [64, 153, 244, 334],
              "duration": 0.819,
              "turn_weight": 1.5,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 2.44,
              "geometry_index": 8,
              "location": [9.227881, 45.481695]
            },
            {
              "entry": [true, true, false],
              "in": 2,
              "bearings": [64, 153, 244],
              "duration": 1.165,
              "turn_weight": 0.75,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 2.096,
              "geometry_index": 9,
              "location": [9.227953, 45.48172]
            },
            {
              "entry": [true, false, false, false],
              "in": 2,
              "bearings": [62, 153, 244, 334],
              "duration": 1.002,
              "turn_weight": 1.5,
              "turn_duration": 0.021,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 2.654,
              "geometry_index": 11,
              "location": [9.228039, 45.48175]
            },
            {
              "bearings": [64, 242, 334],
              "entry": [true, false, true],
              "in": 1,
              "turn_weight": 0.75,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 12,
              "location": [9.228102, 45.481773]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive northeast on Via Giovanni Pacini.",
            "bearing_after": 64,
            "bearing_before": 0,
            "location": [9.225944, 45.48102]
          },
          "name": "Via Giovanni Pacini",
          "duration": 39.318,
          "distance": 238.43,
          "driving_side": "right",
          "weight": 58.336,
          "mode": "driving",
          "geometry":
              "wb}vuAolbrPmFkTeBaHy@gDGUgAmEy@gDsU{_AyAcGq@oCg@mBS}@m@}BqKac@"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [244],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 13,
              "location": [9.228679, 45.481974]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 64,
            "location": [9.228679, 45.481974]
          },
          "name": "Via Giovanni Pacini",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "k~~vuAmwgrP??"
        }
      ],
      "distance": 238.43,
      "summary": "Via Giovanni Pacini"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 4.472,
      "duration": 3.187,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 22.275
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive northeast on <say-as interpret-as=\"address\">Via Giovanni Pacini</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive northeast on Via Giovanni Pacini. Then You will arrive at your destination.",
              "distanceAlongGeometry": 22.275
            }
          ],
          "intersections": [
            {
              "bearings": [64],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.228679, 45.481974]
            },
            {
              "bearings": [64, 122, 244],
              "entry": [true, false, false],
              "in": 2,
              "turn_weight": 0.75,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 1,
              "location": [9.228679, 45.481974]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive northeast on Via Giovanni Pacini.",
            "bearing_after": 64,
            "bearing_before": 0,
            "location": [9.228679, 45.481974]
          },
          "name": "Via Giovanni Pacini",
          "duration": 3.187,
          "distance": 22.275,
          "driving_side": "right",
          "weight": 4.472,
          "mode": "driving",
          "geometry": "k~~vuAmwgrP??mDaO"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [244],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.228936, 45.482061]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 64,
            "location": [9.228936, 45.482061]
          },
          "name": "Via Giovanni Pacini",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "yc_wuAoghrP??"
        }
      ],
      "distance": 22.275,
      "summary": "Via Giovanni Pacini"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.925,
      "duration": 1.021,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 5.147
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive south on <say-as interpret-as=\"address\">Via Giovanni Pacini</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive south on Via Giovanni Pacini. Then You will arrive at your destination.",
              "distanceAlongGeometry": 5.147
            }
          ],
          "intersections": [
            {
              "bearings": [180],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.228936, 45.482061]
            },
            {
              "bearings": [0, 62, 180],
              "entry": [false, true, false],
              "in": 0,
              "turn_weight": 0.75,
              "turn_duration": 0.021,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.228936, 45.482061]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Via Giovanni Pacini.",
            "bearing_after": 180,
            "bearing_before": 0,
            "location": [9.228936, 45.482061]
          },
          "name": "Via Giovanni Pacini",
          "duration": 1.021,
          "distance": 5.147,
          "driving_side": "right",
          "weight": 1.925,
          "mode": "driving",
          "geometry": "yc_wuAoghrP??k@sB"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [242],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.228994, 45.482083]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 62,
            "location": [9.228994, 45.482083]
          },
          "name": "Via Giovanni Pacini",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "ee_wuAckhrP??"
        }
      ],
      "distance": 5.147,
      "summary": "Via Giovanni Pacini"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 44.166,
      "duration": 33.076,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You will arrive at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You will arrive at your destination"
              },
              "distanceAlongGeometry": 180.331
            },
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 69.444
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive south on <say-as interpret-as=\"address\">Via Giovanni Pacini</say-as>. Then, in 600 feet, You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive south on Via Giovanni Pacini. Then, in 600 feet, You will arrive at your destination.",
              "distanceAlongGeometry": 180.331
            },
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">You have arrived at your destination.</prosody></amazon:effect></speak>",
              "announcement": "You have arrived at your destination.",
              "distanceAlongGeometry": 69.444
            }
          ],
          "intersections": [
            {
              "bearings": [180],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.228994, 45.482083]
            },
            {
              "entry": [false, true, false, false],
              "in": 0,
              "bearings": [0, 64, 153, 335],
              "duration": 11.407,
              "turn_weight": 1.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 14.895,
              "geometry_index": 1,
              "location": [9.228994, 45.482083]
            },
            {
              "entry": [true, true, false],
              "in": 2,
              "bearings": [64, 122, 243],
              "duration": 3.844,
              "turn_weight": 0.75,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 5.244,
              "geometry_index": 3,
              "location": [9.229645, 45.48231]
            },
            {
              "entry": [true, false, false, false],
              "in": 2,
              "bearings": [64, 177, 244, 358],
              "duration": 2.494,
              "turn_weight": 1.5,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 4.408,
              "geometry_index": 5,
              "location": [9.229835, 45.482376]
            },
            {
              "mapbox_streets_v8": {"class": "street"},
              "location": [9.229961, 45.48242],
              "geometry_index": 6,
              "admin_index": 0,
              "weight": 3.79,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.019,
              "turn_weight": 2,
              "duration": 3.542,
              "bearings": [0, 63, 179, 244],
              "out": 1,
              "in": 3,
              "entry": [true, true, true, false]
            },
            {
              "bearings": [64, 179, 243, 358],
              "entry": [true, false, false, false],
              "in": 2,
              "turn_weight": 2,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 7,
              "location": [9.230089, 45.482465]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Via Giovanni Pacini.",
            "bearing_after": 180,
            "bearing_before": 0,
            "location": [9.228994, 45.482083]
          },
          "name": "Via Giovanni Pacini",
          "duration": 33.076,
          "distance": 180.331,
          "driving_side": "right",
          "weight": 44.166,
          "mode": "driving",
          "geometry": "ee_wuAckhrP??iIs\\{BaJ}AoGe@kBwA{FyA_GeT{{@"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [244],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 8,
              "location": [9.231063, 45.482804]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 64,
            "location": [9.231063, 45.482804]
          },
          "name": "Via Giovanni Pacini",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "gr`wuAmllrP??"
        }
      ],
      "distance": 180.331,
      "summary": "Via Giovanni Pacini"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 7.256,
      "duration": 5.687,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {"type": "text", "text": "Via Giovanni Pacini"}
                ],
                "type": "turn",
                "modifier": "sharp right",
                "text": "Via Giovanni Pacini"
              },
              "distanceAlongGeometry": 0
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive south on <say-as interpret-as=\"address\">Via Giovanni Pacini</say-as>. Then Make a sharp right to stay on <say-as interpret-as=\"address\">Via Giovanni Pacini</say-as>.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive south on Via Giovanni Pacini. Then Make a sharp right to stay on Via Giovanni Pacini.",
              "distanceAlongGeometry": 0
            }
          ],
          "intersections": [
            {
              "bearings": [187],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.231063, 45.482804]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Via Giovanni Pacini.",
            "bearing_after": 187,
            "bearing_before": 0,
            "location": [9.231063, 45.482804]
          },
          "name": "Via Giovanni Pacini",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "gr`wuAmllrP??"
        },
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 16.39
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">You have arrived at your destination.</prosody></amazon:effect></speak>",
              "announcement": "You have arrived at your destination.",
              "distanceAlongGeometry": 16.39
            }
          ],
          "intersections": [
            {
              "bearings": [7, 63, 346],
              "entry": [false, true, true],
              "in": 0,
              "turn_weight": 5,
              "turn_duration": 3.767,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 1,
              "location": [9.231063, 45.482804]
            }
          ],
          "maneuver": {
            "type": "continue",
            "instruction": "Make a sharp right to stay on Via Giovanni Pacini.",
            "modifier": "sharp right",
            "bearing_after": 346,
            "bearing_before": 187,
            "location": [9.231063, 45.482804]
          },
          "name": "Via Giovanni Pacini",
          "duration": 5.687,
          "distance": 16.39,
          "driving_side": "right",
          "weight": 7.256,
          "mode": "driving",
          "geometry": "gr`wuAmllrP}GbB"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [166],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.231013, 45.482947]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 346,
            "location": [9.231013, 45.482947]
          },
          "name": "Via Giovanni Pacini",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "e{`wuAiilrP??"
        }
      ],
      "distance": 16.39,
      "summary": "Via Giovanni Pacini"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 36.71,
      "duration": 24.985,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {"type": "text", "text": "Via Giovanni Pacini"}
                ],
                "type": "turn",
                "modifier": "right",
                "text": "Via Giovanni Pacini"
              },
              "distanceAlongGeometry": 0
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive south on <say-as interpret-as=\"address\">Via Giovanni Pacini</say-as>. Then Turn right to stay on <say-as interpret-as=\"address\">Via Giovanni Pacini</say-as>.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive south on Via Giovanni Pacini. Then Turn right to stay on Via Giovanni Pacini.",
              "distanceAlongGeometry": 0
            }
          ],
          "intersections": [
            {
              "bearings": [187],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.231013, 45.482947]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Via Giovanni Pacini.",
            "bearing_after": 187,
            "bearing_before": 0,
            "location": [9.231013, 45.482947]
          },
          "name": "Via Giovanni Pacini",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "e{`wuAiilrP??"
        },
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You will arrive at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You will arrive at your destination"
              },
              "distanceAlongGeometry": 81.402
            },
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 69.444
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">You have arrived at your destination.</prosody></amazon:effect></speak>",
              "announcement": "You have arrived at your destination.",
              "distanceAlongGeometry": 69.444
            }
          ],
          "intersections": [
            {
              "entry": [false, false, true, true],
              "in": 0,
              "bearings": [7, 63, 244, 349],
              "duration": 20.477,
              "turn_weight": 14,
              "turn_duration": 6.501,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "weight": 30.422,
              "geometry_index": 1,
              "location": [9.231013, 45.482947]
            },
            {
              "bearings": [64, 244, 298],
              "entry": [false, true, true],
              "in": 0,
              "turn_weight": 1,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 3,
              "location": [9.23025, 45.482683]
            }
          ],
          "maneuver": {
            "type": "continue",
            "instruction": "Turn right to stay on Via Giovanni Pacini.",
            "modifier": "right",
            "bearing_after": 244,
            "bearing_before": 187,
            "location": [9.231013, 45.482947]
          },
          "name": "Via Giovanni Pacini",
          "duration": 24.985,
          "distance": 81.402,
          "driving_side": "right",
          "weight": 36.71,
          "mode": "driving",
          "geometry": "e{`wuAiilrPpJj`@|ChMvBvI"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [64],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 4,
              "location": [9.230078, 45.482623]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 244,
            "location": [9.230078, 45.482623]
          },
          "name": "Via Giovanni Pacini",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "}f`wuA{njrP??"
        }
      ],
      "distance": 81.402,
      "summary": "Via Giovanni Pacini"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 5.525,
      "duration": 3.007,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 10.349
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive west on <say-as interpret-as=\"address\">Via Giovanni Pacini</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive west on Via Giovanni Pacini. Then You will arrive at your destination.",
              "distanceAlongGeometry": 10.349
            }
          ],
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.230078, 45.482623]
            },
            {
              "bearings": [90, 177, 244, 356],
              "entry": [false, false, true, false],
              "in": 0,
              "turn_weight": 2,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 1,
              "location": [9.230078, 45.482623]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Giovanni Pacini.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.230078, 45.482623]
          },
          "name": "Via Giovanni Pacini",
          "duration": 3.007,
          "distance": 10.349,
          "driving_side": "right",
          "weight": 5.525,
          "mode": "driving",
          "geometry": "}f`wuA{njrP??pAlF"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [64],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.229959, 45.482582]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 244,
            "location": [9.229959, 45.482582]
          },
          "name": "Via Giovanni Pacini",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "kd`wuAmgjrP??"
        }
      ],
      "distance": 10.349,
      "summary": "Via Giovanni Pacini"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 32.825,
      "duration": 14.823,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 45.198
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive south on <say-as interpret-as=\"address\">Via Giovanni Pacini</say-as>. Then, in 100 feet, You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive south on Via Giovanni Pacini. Then, in 100 feet, You will arrive at your destination.",
              "distanceAlongGeometry": 45.198
            }
          ],
          "intersections": [
            {
              "bearings": [180],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.229959, 45.482582]
            },
            {
              "mapbox_streets_v8": {"class": "tertiary"},
              "location": [9.229959, 45.482582],
              "geometry_index": 1,
              "admin_index": 0,
              "weight": 17.98,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 3.796,
              "turn_weight": 13.75,
              "duration": 7.396,
              "bearings": [0, 180, 244, 359],
              "out": 1,
              "in": 0,
              "entry": [false, true, true, true]
            },
            {
              "mapbox_streets_v8": {"class": "tertiary"},
              "location": [9.229961, 45.48242],
              "geometry_index": 2,
              "admin_index": 0,
              "weight": 8.645,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.019,
              "turn_weight": 7,
              "duration": 3.419,
              "bearings": [0, 63, 179, 244],
              "out": 2,
              "in": 0,
              "entry": [false, true, true, false]
            },
            {
              "bearings": [68, 180, 248, 359],
              "entry": [false, true, false, false],
              "in": 3,
              "turn_weight": 1.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 3,
              "location": [9.229962, 45.482359]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Via Giovanni Pacini.",
            "bearing_after": 180,
            "bearing_before": 0,
            "location": [9.229959, 45.482582]
          },
          "name": "Via Giovanni Pacini",
          "duration": 14.823,
          "distance": 45.198,
          "driving_side": "right",
          "weight": 32.825,
          "mode": "driving",
          "geometry": "kd`wuAmgjrP??bICxBAlJC"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [0],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 4,
              "location": [9.229964, 45.482176]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 180,
            "location": [9.229964, 45.482176]
          },
          "name": "Via Giovanni Pacini",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "_k_wuAwgjrP??"
        }
      ],
      "distance": 45.198,
      "summary": "Via Giovanni Pacini"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 2.763,
      "duration": 1.507,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 9.685
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive south on <say-as interpret-as=\"address\">Via Giuseppe Ponzio</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive south on Via Giuseppe Ponzio. Then You will arrive at your destination.",
              "distanceAlongGeometry": 9.685
            }
          ],
          "intersections": [
            {
              "bearings": [187],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.229964, 45.482176]
            },
            {
              "bearings": [7, 180, 300],
              "entry": [false, true, false],
              "in": 0,
              "turn_weight": 1,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.229964, 45.482176]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Via Giuseppe Ponzio.",
            "bearing_after": 187,
            "bearing_before": 0,
            "location": [9.229964, 45.482176]
          },
          "name": "Via Giuseppe Ponzio",
          "duration": 1.507,
          "distance": 9.685,
          "driving_side": "right",
          "weight": 2.763,
          "mode": "driving",
          "geometry": "_k_wuAwgjrP??lDA"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [0],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.229965, 45.482089]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 180,
            "location": [9.229965, 45.482089]
          },
          "name": "Via Giuseppe Ponzio",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "qe_wuAygjrP??"
        }
      ],
      "distance": 9.685,
      "summary": "Via Giuseppe Ponzio"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 19.17,
      "duration": 14.426,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You will arrive at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You will arrive at your destination"
              },
              "distanceAlongGeometry": 115.775
            },
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 69.444
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive south on <say-as interpret-as=\"address\">Via Giuseppe Ponzio</say-as>. Then, in 400 feet, You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive south on Via Giuseppe Ponzio. Then, in 400 feet, You will arrive at your destination.",
              "distanceAlongGeometry": 115.775
            }
          ],
          "intersections": [
            {
              "bearings": [180],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.229965, 45.482089]
            },
            {
              "entry": [false, true, true],
              "in": 0,
              "bearings": [0, 90, 180],
              "duration": 13.29,
              "turn_weight": 0.75,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "weight": 16.357,
              "geometry_index": 1,
              "location": [9.229965, 45.482089]
            },
            {
              "bearings": [0, 89, 179, 269],
              "entry": [false, false, true, false],
              "in": 0,
              "turn_weight": 1.5,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 2,
              "location": [9.229974, 45.481128]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Via Giuseppe Ponzio.",
            "bearing_after": 180,
            "bearing_before": 0,
            "location": [9.229965, 45.482089]
          },
          "name": "Via Giuseppe Ponzio",
          "duration": 14.426,
          "distance": 115.775,
          "driving_side": "right",
          "weight": 19.17,
          "mode": "driving",
          "geometry": "qe_wuAygjrP??`{@Q|CA"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [359],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 3,
              "location": [9.229975, 45.481049]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 179,
            "location": [9.229975, 45.481049]
          },
          "name": "Via Giuseppe Ponzio",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "qd}vuAmhjrP??"
        }
      ],
      "distance": 115.775,
      "summary": "Via Giuseppe Ponzio"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 12.273,
      "duration": 9.814,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You will arrive at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You will arrive at your destination"
              },
              "distanceAlongGeometry": 79.484
            },
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 69.444
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive south on <say-as interpret-as=\"address\">Via Giuseppe Ponzio</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive south on Via Giuseppe Ponzio. Then You will arrive at your destination.",
              "distanceAlongGeometry": 79.484
            }
          ],
          "intersections": [
            {
              "bearings": [180],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.229975, 45.481049]
            },
            {
              "bearings": [0, 180, 270],
              "entry": [false, true, false],
              "in": 0,
              "turn_weight": 0.75,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.229975, 45.481049]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Via Giuseppe Ponzio.",
            "bearing_after": 180,
            "bearing_before": 0,
            "location": [9.229975, 45.481049]
          },
          "name": "Via Giuseppe Ponzio",
          "duration": 9.814,
          "distance": 79.484,
          "driving_side": "right",
          "weight": 12.273,
          "mode": "driving",
          "geometry": "qd}vuAmhjrP??rk@M"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [0],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.229982, 45.480335]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 180,
            "location": [9.229982, 45.480335]
          },
          "name": "Via Giuseppe Ponzio",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "}w{vuA{hjrP??"
        }
      ],
      "distance": 79.484,
      "summary": "Via Giuseppe Ponzio"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 23.545,
      "duration": 19.407,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You will arrive at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You will arrive at your destination"
              },
              "distanceAlongGeometry": 97.297
            },
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 69.444
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive south on <say-as interpret-as=\"address\">Via Giuseppe Ponzio</say-as>. Then, in 300 feet, You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive south on Via Giuseppe Ponzio. Then, in 300 feet, You will arrive at your destination.",
              "distanceAlongGeometry": 97.297
            }
          ],
          "intersections": [
            {
              "bearings": [180],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.229982, 45.480335]
            },
            {
              "bearings": [0, 87, 180],
              "entry": [false, true, true],
              "in": 0,
              "turn_weight": 0.75,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 1,
              "location": [9.229982, 45.480335]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Via Giuseppe Ponzio.",
            "bearing_after": 180,
            "bearing_before": 0,
            "location": [9.229982, 45.480335]
          },
          "name": "Via Giuseppe Ponzio",
          "duration": 19.407,
          "distance": 97.297,
          "driving_side": "right",
          "weight": 23.545,
          "mode": "driving",
          "geometry": "}w{vuA{hjrP??ru@S"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [0],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.229992, 45.479461]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 180,
            "location": [9.229992, 45.479461]
          },
          "name": "Via Giuseppe Ponzio",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "iazvuAoijrP??"
        }
      ],
      "distance": 97.297,
      "summary": "Via Giuseppe Ponzio"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 3.38,
      "duration": 1.607,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 8.349
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive south on <say-as interpret-as=\"address\">Via Giuseppe Ponzio</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive south on Via Giuseppe Ponzio. Then You will arrive at your destination.",
              "distanceAlongGeometry": 8.349
            }
          ],
          "intersections": [
            {
              "bearings": [180],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.229992, 45.479461]
            },
            {
              "bearings": [0, 90, 180, 269],
              "entry": [false, false, true, false],
              "in": 0,
              "turn_weight": 1.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 1,
              "location": [9.229992, 45.479461]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Via Giuseppe Ponzio.",
            "bearing_after": 180,
            "bearing_before": 0,
            "location": [9.229992, 45.479461]
          },
          "name": "Via Giuseppe Ponzio",
          "duration": 1.607,
          "distance": 8.349,
          "driving_side": "right",
          "weight": 3.38,
          "mode": "driving",
          "geometry": "iazvuAoijrP??tC?"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [0],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.229992, 45.479386]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 180,
            "location": [9.229992, 45.479386]
          },
          "name": "Via Giuseppe Ponzio",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "s|yvuAoijrP??"
        }
      ],
      "distance": 8.349,
      "summary": "Via Giuseppe Ponzio"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 4.004,
      "duration": 3.724,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 9.241
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive south on <say-as interpret-as=\"address\">Via Giuseppe Ponzio</say-as>. Then, in 30 feet, You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive south on Via Giuseppe Ponzio. Then, in 30 feet, You will arrive at your destination.",
              "distanceAlongGeometry": 9.241
            }
          ],
          "intersections": [
            {
              "bearings": [179],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.229992, 45.479386]
            },
            {
              "bearings": [90, 179, 269, 359],
              "entry": [false, true, true, false],
              "in": 3,
              "turn_weight": 2,
              "turn_duration": 2.019,
              "traffic_signal": true,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.229992, 45.479386]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Via Giuseppe Ponzio.",
            "bearing_after": 179,
            "bearing_before": 0,
            "location": [9.229992, 45.479386]
          },
          "name": "Via Giuseppe Ponzio",
          "duration": 3.724,
          "distance": 9.241,
          "driving_side": "right",
          "weight": 4.004,
          "mode": "driving",
          "geometry": "s|yvuAoijrP??lBAv@A"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [359],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 3,
              "location": [9.229994, 45.479303]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 179,
            "location": [9.229994, 45.479303]
          },
          "name": "Via Giuseppe Ponzio",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "mwyvuAsijrP??"
        }
      ],
      "distance": 9.241,
      "summary": "Via Giuseppe Ponzio"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 2.308,
      "duration": 1.326,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 7.013
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive south on <say-as interpret-as=\"address\">Via Giuseppe Ponzio</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive south on Via Giuseppe Ponzio. Then You will arrive at your destination.",
              "distanceAlongGeometry": 7.013
            }
          ],
          "intersections": [
            {
              "bearings": [180],
              "entry": [true],
              "traffic_signal": true,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.229994, 45.479303]
            },
            {
              "bearings": [0, 180],
              "entry": [false, true],
              "in": 0,
              "turn_weight": 0.75,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.229994, 45.479303]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Via Giuseppe Ponzio.",
            "bearing_after": 180,
            "bearing_before": 0,
            "location": [9.229994, 45.479303]
          },
          "name": "Via Giuseppe Ponzio",
          "duration": 1.326,
          "distance": 7.013,
          "driving_side": "right",
          "weight": 2.308,
          "mode": "driving",
          "geometry": "mwyvuAsijrP??|B?"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [0],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.229994, 45.47924]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 180,
            "location": [9.229994, 45.47924]
          },
          "name": "Via Giuseppe Ponzio",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "osyvuAsijrP??"
        }
      ],
      "distance": 7.013,
      "summary": "Via Giuseppe Ponzio"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 29.381,
      "duration": 22.619,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You will arrive at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You will arrive at your destination"
              },
              "distanceAlongGeometry": 117.942
            },
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 69.444
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive east on <say-as interpret-as=\"address\">Via Giuseppe Ponzio</say-as>. Then, in 400 feet, You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive east on Via Giuseppe Ponzio. Then, in 400 feet, You will arrive at your destination.",
              "distanceAlongGeometry": 117.942
            }
          ],
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.229994, 45.47924]
            },
            {
              "mapbox_streets_v8": {"class": "tertiary"},
              "location": [9.229994, 45.47924],
              "geometry_index": 1,
              "admin_index": 0,
              "weight": 12.115,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 7.395,
              "turn_weight": 10,
              "duration": 9.195,
              "bearings": [90, 179, 270, 270],
              "out": 0,
              "in": 3,
              "entry": [true, true, false, false]
            },
            {
              "bearings": [90, 179, 270, 359],
              "entry": [true, false, false, false],
              "in": 2,
              "turn_weight": 1.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 2,
              "location": [9.230168, 45.479239]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive east on Via Giuseppe Ponzio.",
            "bearing_after": 90,
            "bearing_before": 0,
            "location": [9.229994, 45.47924]
          },
          "name": "Via Giuseppe Ponzio",
          "duration": 22.619,
          "distance": 117.942,
          "driving_side": "right",
          "weight": 29.381,
          "mode": "driving",
          "geometry": "osyvuAsijrP??@{IKqrA"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 3,
              "location": [9.231505, 45.479245]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 90,
            "location": [9.231505, 45.479245]
          },
          "name": "Via Giuseppe Ponzio",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "ysyvuAahmrP??"
        }
      ],
      "distance": 117.942,
      "summary": "Via Giuseppe Ponzio"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.655,
      "duration": 1.409,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 8.543
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive north on <say-as interpret-as=\"address\">Via Edoardo Bassini</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive north on Via Edoardo Bassini. Then You will arrive at your destination.",
              "distanceAlongGeometry": 8.543
            }
          ],
          "intersections": [
            {
              "bearings": [345],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.231683, 45.479266]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive north on Via Edoardo Bassini.",
            "bearing_after": 345,
            "bearing_before": 0,
            "location": [9.231683, 45.479266]
          },
          "name": "Via Edoardo Bassini",
          "duration": 1.409,
          "distance": 8.543,
          "driving_side": "right",
          "weight": 1.655,
          "mode": "driving",
          "geometry": "cuyvuAesmrPsCx@"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [165],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.231654, 45.47934]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 345,
            "location": [9.231654, 45.47934]
          },
          "name": "Via Edoardo Bassini",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "wyyvuAkqmrP??"
        }
      ],
      "distance": 8.543,
      "summary": "Via Edoardo Bassini"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 2.287,
      "duration": 1.096,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 7.387
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive west on <say-as interpret-as=\"address\">Via Edoardo Bassini</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive west on Via Edoardo Bassini. Then You will arrive at your destination.",
              "distanceAlongGeometry": 7.387
            }
          ],
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.231654, 45.47934]
            },
            {
              "bearings": [90, 345],
              "entry": [false, true],
              "in": 0,
              "turn_weight": 1,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.231654, 45.47934]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Edoardo Bassini.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.231654, 45.47934]
          },
          "name": "Via Edoardo Bassini",
          "duration": 1.096,
          "distance": 7.387,
          "driving_side": "right",
          "weight": 2.287,
          "mode": "driving",
          "geometry": "wyyvuAkqmrP??_Cp@"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [165],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.231629, 45.479404]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 345,
            "location": [9.231629, 45.479404]
          },
          "name": "Via Edoardo Bassini",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "w}yvuAyomrP??"
        }
      ],
      "distance": 7.387,
      "summary": "Via Edoardo Bassini"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 9.085,
      "duration": 5.262,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 6.747
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive south on <say-as interpret-as=\"address\">Via Edoardo Bassini</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive south on Via Edoardo Bassini. Then You will arrive at your destination.",
              "distanceAlongGeometry": 6.747
            }
          ],
          "intersections": [
            {
              "bearings": [180],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.231629, 45.479404]
            },
            {
              "bearings": [0, 63, 260],
              "entry": [false, false, true],
              "in": 0,
              "turn_weight": 7.5,
              "turn_duration": 3.913,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 1,
              "location": [9.231629, 45.479404]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Via Edoardo Bassini.",
            "bearing_after": 180,
            "bearing_before": 0,
            "location": [9.231629, 45.479404]
          },
          "name": "Via Edoardo Bassini",
          "duration": 5.262,
          "distance": 6.747,
          "driving_side": "right",
          "weight": 9.085,
          "mode": "driving",
          "geometry": "w}yvuAyomrP??ThD"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [80],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.231544, 45.479393]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 260,
            "location": [9.231544, 45.479393]
          },
          "name": "Via Edoardo Bassini",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "a}yvuAojmrP??"
        }
      ],
      "distance": 6.747,
      "summary": "Via Edoardo Bassini"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 25.205,
      "duration": 21.451,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You will arrive at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You will arrive at your destination"
              },
              "distanceAlongGeometry": 107.56
            },
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 69.444
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive west on <say-as interpret-as=\"address\">Via Edoardo Bassini</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive west on Via Edoardo Bassini. Then You will arrive at your destination.",
              "distanceAlongGeometry": 107.56
            }
          ],
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.231544, 45.479393]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Edoardo Bassini.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.231544, 45.479393]
          },
          "name": "Via Edoardo Bassini",
          "duration": 21.451,
          "distance": 107.56,
          "driving_side": "right",
          "weight": 25.205,
          "mode": "driving",
          "geometry": "a}yvuAojmrPB~^Fbu@"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.230166, 45.479387]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.230166, 45.479387]
          },
          "name": "Via Edoardo Bassini",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "u|yvuAktjrP??"
        }
      ],
      "distance": 107.56,
      "summary": "Via Edoardo Bassini"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 12.501,
      "duration": 5.431,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 19.126
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive south on <say-as interpret-as=\"address\">Via Edoardo Bassini</say-as>. Then, in 60 feet, You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive south on Via Edoardo Bassini. Then, in 60 feet, You will arrive at your destination.",
              "distanceAlongGeometry": 19.126
            }
          ],
          "intersections": [
            {
              "bearings": [201],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.230166, 45.479387]
            },
            {
              "entry": [false, false, true, false],
              "in": 0,
              "bearings": [21, 179, 270, 359],
              "duration": 2.807,
              "turn_weight": 1.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "weight": 4.79,
              "geometry_index": 1,
              "location": [9.230166, 45.479387]
            },
            {
              "bearings": [0, 90, 179, 269],
              "entry": [true, false, true, true],
              "in": 1,
              "turn_weight": 7,
              "turn_duration": 2.019,
              "traffic_signal": true,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 3,
              "geometry_index": 3,
              "location": [9.229992, 45.479386]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Via Edoardo Bassini.",
            "bearing_after": 201,
            "bearing_before": 0,
            "location": [9.230166, 45.479387]
          },
          "name": "Via Edoardo Bassini",
          "duration": 5.431,
          "distance": 19.126,
          "driving_side": "right",
          "weight": 12.501,
          "mode": "driving",
          "geometry": "u|yvuAktjrP??@xB?`F@lC"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 4,
              "location": [9.229921, 45.479385]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.229921, 45.479385]
          },
          "name": "Via Edoardo Bassini",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "q|yvuAaejrP??"
        }
      ],
      "distance": 19.126,
      "summary": "Via Edoardo Bassini"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.699,
      "duration": 0.595,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 5.932
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive west on <say-as interpret-as=\"address\">Via Edoardo Bonardi</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive west on Via Edoardo Bonardi. Then You will arrive at your destination.",
              "distanceAlongGeometry": 5.932
            }
          ],
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "traffic_signal": true,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.229921, 45.479385]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Edoardo Bonardi.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.229921, 45.479385]
          },
          "name": "Via Edoardo Bonardi",
          "duration": 0.595,
          "distance": 5.932,
          "driving_side": "right",
          "weight": 0.699,
          "mode": "driving",
          "geometry": "q|yvuAaejrP?vC"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.229845, 45.479385]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.229845, 45.479385]
          },
          "name": "Via Edoardo Bonardi",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "q|yvuAi`jrP??"
        }
      ],
      "distance": 5.932,
      "summary": "Via Edoardo Bonardi"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 25.342,
      "duration": 20.298,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You will arrive at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You will arrive at your destination"
              },
              "distanceAlongGeometry": 186.326
            },
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 69.444
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive west on <say-as interpret-as=\"address\">Via Edoardo Bonardi</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive west on Via Edoardo Bonardi. Then You will arrive at your destination.",
              "distanceAlongGeometry": 186.326
            },
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">You have arrived at your destination.</prosody></amazon:effect></speak>",
              "announcement": "You have arrived at your destination.",
              "distanceAlongGeometry": 69.444
            }
          ],
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "traffic_signal": true,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.229845, 45.479385]
            },
            {
              "bearings": [89, 179, 269, 358],
              "entry": [false, false, true, false],
              "in": 0,
              "turn_weight": 1.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 1,
              "location": [9.229845, 45.479385]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Edoardo Bonardi.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.229845, 45.479385]
          },
          "name": "Via Edoardo Bonardi",
          "duration": 20.298,
          "distance": 186.326,
          "driving_side": "right",
          "weight": 25.342,
          "mode": "driving",
          "geometry": "q|yvuAi`jrP??d@dtC"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.227458, 45.479366]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.227458, 45.479366]
          },
          "name": "Via Edoardo Bonardi",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "k{yvuAckerP??"
        }
      ],
      "distance": 186.326,
      "summary": "Via Edoardo Bonardi"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 8.74,
      "duration": 6.807,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 33.721
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive west on <say-as interpret-as=\"address\">Via Edoardo Bonardi</say-as>. Then, in 100 feet, You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive west on Via Edoardo Bonardi. Then, in 100 feet, You will arrive at your destination.",
              "distanceAlongGeometry": 33.721
            }
          ],
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.227458, 45.479366]
            },
            {
              "bearings": [89, 269, 359],
              "entry": [false, true, true],
              "in": 0,
              "turn_weight": 0.75,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.227458, 45.479366]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Edoardo Bonardi.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.227458, 45.479366]
          },
          "name": "Via Edoardo Bonardi",
          "duration": 6.807,
          "distance": 33.721,
          "driving_side": "right",
          "weight": 8.74,
          "mode": "driving",
          "geometry": "k{yvuAckerP??D~Y"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.227026, 45.479363]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.227026, 45.479363]
          },
          "name": "Via Edoardo Bonardi",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "e{yvuAcpdrP??"
        }
      ],
      "distance": 33.721,
      "summary": "Via Edoardo Bonardi"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 10.613,
      "duration": 4.138,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 20.692
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive west on <say-as interpret-as=\"address\">Via Edoardo Bonardi</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive west on Via Edoardo Bonardi. Then You will arrive at your destination.",
              "distanceAlongGeometry": 20.692
            }
          ],
          "intersections": [
            {
              "bearings": [268],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.227026, 45.479363]
            },
            {
              "bearings": [88, 268],
              "entry": [false, true],
              "in": 0,
              "turn_weight": 5.75,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.227026, 45.479363]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Edoardo Bonardi.",
            "bearing_after": 268,
            "bearing_before": 0,
            "location": [9.227026, 45.479363]
          },
          "name": "Via Edoardo Bonardi",
          "duration": 4.138,
          "distance": 20.692,
          "driving_side": "right",
          "weight": 10.613,
          "mode": "driving",
          "geometry": "e{yvuAcpdrP??HpO"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [88],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.226761, 45.479358]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 268,
            "location": [9.226761, 45.479358]
          },
          "name": "Via Edoardo Bonardi",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "{zyvuAq_drP??"
        }
      ],
      "distance": 20.692,
      "summary": "Via Edoardo Bonardi"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.482,
      "duration": 1.262,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 6.636
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive west on <say-as interpret-as=\"address\">Piazza Leonardo da Vinci</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive west on Piazza Leonardo da Vinci. Then You will arrive at your destination.",
              "distanceAlongGeometry": 6.636
            }
          ],
          "intersections": [
            {
              "bearings": [271],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.226761, 45.479358]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Piazza Leonardo da Vinci.",
            "bearing_after": 271,
            "bearing_before": 0,
            "location": [9.226761, 45.479358]
          },
          "name": "Piazza Leonardo da Vinci",
          "duration": 1.262,
          "distance": 6.636,
          "driving_side": "right",
          "weight": 1.482,
          "mode": "driving",
          "geometry": "{zyvuAq_drPAhD"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [91],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.226676, 45.479359]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 271,
            "location": [9.226676, 45.479359]
          },
          "name": "Piazza Leonardo da Vinci",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "}zyvuAgzcrP??"
        }
      ],
      "distance": 6.636,
      "summary": "Piazza Leonardo da Vinci"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 4.835,
      "duration": 2.214,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 11.632
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive south on <say-as interpret-as=\"address\">Piazza Leonardo da Vinci</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive south on Piazza Leonardo da Vinci. Then You will arrive at your destination.",
              "distanceAlongGeometry": 11.632
            }
          ],
          "intersections": [
            {
              "bearings": [180],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.226676, 45.479359]
            },
            {
              "entry": [false, false, false, true],
              "in": 1,
              "bearings": [0, 0, 180, 269],
              "duration": 1.007,
              "turn_weight": 1.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 3,
              "weight": 2.675,
              "geometry_index": 1,
              "location": [9.226676, 45.479359]
            },
            {
              "bearings": [89, 269, 359],
              "entry": [false, true, false],
              "in": 0,
              "turn_weight": 0.75,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 2,
              "location": [9.226607, 45.479358]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Piazza Leonardo da Vinci.",
            "bearing_after": 180,
            "bearing_before": 0,
            "location": [9.226676, 45.479359]
          },
          "name": "Piazza Leonardo da Vinci",
          "duration": 2.214,
          "distance": 11.632,
          "driving_side": "right",
          "weight": 4.835,
          "mode": "driving",
          "geometry": "}zyvuAgzcrP??@hC@~C"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 3,
              "location": [9.226527, 45.479357]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.226527, 45.479357]
          },
          "name": "Piazza Leonardo da Vinci",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "yzyvuA}pcrP??"
        }
      ],
      "distance": 11.632,
      "summary": "Piazza Leonardo da Vinci"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 5.92,
      "duration": 4.4,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 22.092
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive west on <say-as interpret-as=\"address\">Piazza Leonardo da Vinci</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive west on Piazza Leonardo da Vinci. Then You will arrive at your destination.",
              "distanceAlongGeometry": 22.092
            }
          ],
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 0,
              "geometry_index": 0,
              "location": [9.226527, 45.479357]
            },
            {
              "bearings": [90, 269],
              "entry": [false, true],
              "in": 0,
              "turn_weight": 0.75,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.226527, 45.479357]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Piazza Leonardo da Vinci.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.226527, 45.479357]
          },
          "name": "Piazza Leonardo da Vinci",
          "duration": 4.4,
          "distance": 22.092,
          "driving_side": "right",
          "weight": 5.92,
          "mode": "driving",
          "geometry": "yzyvuA}pcrP??DtP"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.226244, 45.479354]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.226244, 45.479354]
          },
          "name": "Piazza Leonardo da Vinci",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "szyvuAg_crP??"
        }
      ],
      "distance": 22.092,
      "summary": "Piazza Leonardo da Vinci"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 16.344,
      "duration": 10.101,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {"type": "text", "text": "Piazza Leonardo da Vinci"}
                ],
                "type": "fork",
                "modifier": "right",
                "text": "Piazza Leonardo da Vinci"
              },
              "distanceAlongGeometry": 0
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive west on <say-as interpret-as=\"address\">Piazza Leonardo da Vinci</say-as>. Then Keep right to stay on <say-as interpret-as=\"address\">Piazza Leonardo da Vinci</say-as>.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive west on Piazza Leonardo da Vinci. Then Keep right to stay on Piazza Leonardo da Vinci.",
              "distanceAlongGeometry": 0
            }
          ],
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.226244, 45.479354]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Piazza Leonardo da Vinci.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.226244, 45.479354]
          },
          "name": "Piazza Leonardo da Vinci",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "szyvuAg_crP??"
        },
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 43.164
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">You have arrived at your destination.</prosody></amazon:effect></speak>",
              "announcement": "You have arrived at your destination.",
              "distanceAlongGeometry": 43.164
            }
          ],
          "intersections": [
            {
              "entry": [false, true, true],
              "in": 0,
              "bearings": [90, 252, 270],
              "duration": 1.447,
              "turn_weight": 0.75,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "weight": 2.442,
              "geometry_index": 1,
              "location": [9.226244, 45.479354]
            },
            {
              "entry": [false, true],
              "in": 0,
              "bearings": [90, 270],
              "duration": 6,
              "turn_weight": 0.75,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 7.8,
              "geometry_index": 2,
              "location": [9.226165, 45.479354]
            },
            {
              "entry": [false, false, false, true],
              "in": 1,
              "bearings": [0, 90, 180, 270],
              "duration": 1.447,
              "turn_weight": 1.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 3,
              "weight": 3.192,
              "geometry_index": 4,
              "location": [9.225845, 45.479355]
            },
            {
              "bearings": [90, 175, 270, 358],
              "entry": [false, false, true, true],
              "in": 0,
              "turn_weight": 1.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 5,
              "location": [9.225773, 45.479355]
            }
          ],
          "maneuver": {
            "type": "fork",
            "instruction": "Keep right to stay on Piazza Leonardo da Vinci.",
            "modifier": "slight right",
            "bearing_after": 270,
            "bearing_before": 270,
            "location": [9.226244, 45.479354]
          },
          "name": "Piazza Leonardo da Vinci",
          "duration": 10.101,
          "distance": 43.164,
          "driving_side": "right",
          "weight": 16.344,
          "mode": "driving",
          "geometry": "szyvuAg_crP?|CAzN?bC?nC?bD"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 6,
              "location": [9.225691, 45.479355]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.225691, 45.479355]
          },
          "name": "Piazza Leonardo da Vinci",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "uzyvuAu|arP??"
        }
      ],
      "distance": 43.164,
      "summary": "Piazza Leonardo da Vinci"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 3.615,
      "duration": 1.807,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 8.898
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive west on <say-as interpret-as=\"address\">Piazza Leonardo da Vinci</say-as>. Then You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive west on Piazza Leonardo da Vinci. Then You will arrive at your destination.",
              "distanceAlongGeometry": 8.898
            }
          ],
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.225691, 45.479355]
            },
            {
              "bearings": [1, 90, 182, 270],
              "entry": [false, false, false, true],
              "in": 1,
              "turn_weight": 1.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 3,
              "geometry_index": 1,
              "location": [9.225691, 45.479355]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Piazza Leonardo da Vinci.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.225691, 45.479355]
          },
          "name": "Piazza Leonardo da Vinci",
          "duration": 1.807,
          "distance": 8.898,
          "driving_side": "right",
          "weight": 3.615,
          "mode": "driving",
          "geometry": "uzyvuAu|arP???bF"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.225577, 45.479355]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.225577, 45.479355]
          },
          "name": "Piazza Leonardo da Vinci",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "uzyvuAquarP??"
        }
      ],
      "distance": 8.898,
      "summary": "Piazza Leonardo da Vinci"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 20.856,
      "duration": 11.352,
      "steps": [
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "You have arrived at your destination"
                  }
                ],
                "type": "arrive",
                "modifier": "straight",
                "text": "You have arrived at your destination"
              },
              "distanceAlongGeometry": 59.245
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive northwest on <say-as interpret-as=\"address\">Piazza Leonardo da Vinci</say-as>. Then, in 200 feet, You will arrive at your destination.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive northwest on Piazza Leonardo da Vinci. Then, in 200 feet, You will arrive at your destination.",
              "distanceAlongGeometry": 59.245
            }
          ],
          "intersections": [
            {
              "bearings": [305],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.225577, 45.479355]
            },
            {
              "entry": [false, true, true, true],
              "in": 0,
              "bearings": [125, 138, 158, 305],
              "duration": 4.477,
              "turn_weight": 6.125,
              "turn_duration": 0.077,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 3,
              "weight": 11.295,
              "geometry_index": 1,
              "location": [9.225577, 45.479355]
            },
            {
              "entry": [false, true, true],
              "in": 0,
              "bearings": [125, 215, 305],
              "duration": 2.007,
              "turn_weight": 0.75,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "weight": 3.1,
              "geometry_index": 3,
              "location": [9.225346, 45.479468]
            },
            {
              "bearings": [37, 125, 305],
              "entry": [true, false, true],
              "in": 1,
              "turn_weight": 0.75,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 4,
              "location": [9.225239, 45.47952]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive northwest on Piazza Leonardo da Vinci.",
            "bearing_after": 305,
            "bearing_before": 0,
            "location": [9.225577, 45.479355]
          },
          "name": "Piazza Leonardo da Vinci",
          "duration": 11.352,
          "distance": 59.245,
          "driving_side": "right",
          "weight": 20.856,
          "mode": "driving",
          "geometry": "uzyvuAquarP??o@|AqDnJgBtEuGxP"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [125],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 5,
              "location": [9.224954, 45.479659]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 305,
            "location": [9.224954, 45.479659]
          },
          "name": "Piazza Leonardo da Vinci",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "umzvuAsn`rP??"
        }
      ],
      "distance": 59.245,
      "summary": "Piazza Leonardo da Vinci"
    }
  ],
  "geometry":
      "wb}vuAolbrPmFkTeBaHy@gDGUgAmEy@gDsU{_AyAcGq@oCg@mBS}@m@}BqKac@??mDaO??k@sB??iIs\\{BaJ}AoGe@kBwA{FyA_GeT{{@??}GbB??pJj`@|ChMvBvI??pAlF??bICxBAlJC??lDA??`{@Q|CA??rk@M??ru@S??tC???lBAv@A??|B???@{IKqrAi@cJ??sCx@??_Cp@??ThDB~^Fbu@??@xB?`F@lC?vC??d@dtC??D~Y??HpOAhD??@hC@~C??DtP???|CAzN?bC?nC?bD???bF??o@|AqDnJgBtEuGxP",
  "voiceLocale": "en-US"
};
