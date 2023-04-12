const predefinedRouteExample = {
  "weight_name": "auto",
  "weight": 809.199,
  "duration": 596.817,
  "distance": 2794.409,
  "legs": [
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "USA", "iso_3166_1": "US"}
      ],
      "weight": 809.199,
      "duration": 596.817,
      "steps": [
        {
          "bannerInstructions": [
            {
              "sub": {
                "components": [
                  {
                    "active_direction": "left",
                    "active": true,
                    "directions": ["left"],
                    "type": "lane",
                    "text": ""
                  },
                  {
                    "active": false,
                    "directions": ["straight"],
                    "type": "lane",
                    "text": ""
                  },
                  {
                    "active": false,
                    "directions": ["straight"],
                    "type": "lane",
                    "text": ""
                  },
                  {
                    "active": false,
                    "directions": ["straight"],
                    "type": "lane",
                    "text": ""
                  }
                ],
                "text": ""
              },
              "primary": {
                "components": [
                  {"type": "text", "text": "Divisadero Street"}
                ],
                "type": "turn",
                "modifier": "left",
                "text": "Divisadero Street"
              },
              "distanceAlongGeometry": 203.954
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Drive west on <say-as interpret-as=\"address\">Fell Street</say-as>. Then, in 700 feet, Turn left onto <say-as interpret-as=\"address\">Divisadero Street</say-as>.</prosody></amazon:effect></speak>",
              "announcement":
                  "Drive west on Fell Street. Then, in 700 feet, Turn left onto Divisadero Street.",
              "distanceAlongGeometry": 203.954
            },
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Turn left onto <say-as interpret-as=\"address\">Divisadero Street</say-as>.</prosody></amazon:effect></speak>",
              "announcement": "Turn left onto Divisadero Street.",
              "distanceAlongGeometry": 88.187
            }
          ],
          "intersections": [
            {
              "entry": [true],
              "bearings": [261],
              "duration": 1.065,
              "mapbox_streets_v8": {"class": "primary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 1.304,
              "geometry_index": 0,
              "location": [-122.435388, 37.774357]
            },
            {
              "entry": [false, true, true],
              "in": 0,
              "bearings": [81, 261, 351],
              "duration": 5.499,
              "turn_duration": 0.021,
              "mapbox_streets_v8": {"class": "primary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 6.711,
              "geometry_index": 1,
              "location": [-122.435472, 37.774346]
            },
            {
              "entry": [false, false, true, false],
              "in": 0,
              "bearings": [81, 170, 261, 352],
              "duration": 1.429,
              "turn_duration": 0.021,
              "mapbox_streets_v8": {"class": "primary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "weight": 1.726,
              "geometry_index": 3,
              "location": [-122.435862, 37.774297]
            },
            {
              "entry": [false, false, true, true],
              "in": 0,
              "bearings": [81, 170, 261, 351],
              "duration": 3.657,
              "turn_duration": 2.021,
              "traffic_signal": true,
              "mapbox_streets_v8": {"class": "primary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "weight": 2.005,
              "geometry_index": 4,
              "location": [-122.435961, 37.774284]
            },
            {
              "entry": [false, false, true, false],
              "in": 0,
              "bearings": [81, 168, 261, 348],
              "duration": 8.53,
              "turn_duration": 0.021,
              "mapbox_streets_v8": {"class": "primary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "weight": 10.211,
              "geometry_index": 6,
              "location": [-122.436074, 37.77427]
            },
            {
              "entry": [false, true],
              "in": 0,
              "bearings": [81, 261],
              "duration": 7.527,
              "mapbox_streets_v8": {"class": "primary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 9.033,
              "geometry_index": 7,
              "location": [-122.436661, 37.774194]
            },
            {
              "entry": [false, true, true],
              "in": 0,
              "bearings": [81, 169, 260],
              "duration": 1.347,
              "lanes": [
                {
                  "indications": ["left"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["straight"],
                  "valid_indication": "straight",
                  "valid": true,
                  "active": true
                },
                {
                  "indications": ["straight"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["straight"],
                  "valid": false,
                  "active": false
                }
              ],
              "turn_duration": 0.021,
              "mapbox_streets_v8": {"class": "primary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "weight": 1.592,
              "geometry_index": 8,
              "location": [-122.437173, 37.77413]
            },
            {
              "lanes": [
                {
                  "indications": ["left"],
                  "valid_indication": "left",
                  "valid": true,
                  "active": true
                },
                {
                  "indications": ["straight"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["straight"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["straight"],
                  "valid": false,
                  "active": false
                }
              ],
              "entry": [false, true],
              "in": 0,
              "bearings": [80, 261],
              "duration": 2.842,
              "mapbox_streets_v8": {"class": "primary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 3.411,
              "geometry_index": 9,
              "location": [-122.437246, 37.77412]
            },
            {
              "entry": [false, false, true],
              "in": 0,
              "bearings": [81, 169, 262],
              "duration": 1.074,
              "lanes": [
                {
                  "indications": ["left"],
                  "valid_indication": "left",
                  "valid": true,
                  "active": true
                },
                {
                  "indications": ["straight"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["straight"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["straight", "right"],
                  "valid": false,
                  "active": false
                }
              ],
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "primary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "weight": 1.28,
              "geometry_index": 10,
              "location": [-122.437413, 37.774098]
            },
            {
              "entry": [false, false, true, false],
              "in": 0,
              "bearings": [82, 173, 260, 353],
              "duration": 0.954,
              "lanes": [
                {
                  "indications": ["left"],
                  "valid_indication": "left",
                  "valid": true,
                  "active": true
                },
                {
                  "indications": ["straight"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["straight"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["straight"],
                  "valid": false,
                  "active": false
                }
              ],
              "turn_duration": 0.021,
              "mapbox_streets_v8": {"class": "primary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "weight": 1.12,
              "geometry_index": 11,
              "location": [-122.437501, 37.774088]
            },
            {
              "bearings": [80, 170, 261, 351],
              "entry": [false, false, true, true],
              "in": 0,
              "turn_weight": 1.5,
              "lanes": [
                {
                  "indications": ["left"],
                  "valid_indication": "left",
                  "valid": true,
                  "active": true
                },
                {
                  "indications": ["straight"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["straight"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["straight"],
                  "valid": false,
                  "active": false
                }
              ],
              "turn_duration": 2.007,
              "traffic_signal": true,
              "mapbox_streets_v8": {"class": "primary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 12,
              "location": [-122.437584, 37.774077]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Fell Street.",
            "bearing_after": 261,
            "bearing_before": 0,
            "location": [-122.435388, 37.774357]
          },
          "name": "Fell Street",
          "duration": 36.891,
          "distance": 203.954,
          "driving_side": "right",
          "weight": 41.043,
          "mode": "driving",
          "geometry":
              "i`q`gAvrzohFTfD~@zN`@nGXdEFdARzCvCtc@~B~^RpCj@lIRnDTdDTvD"
        },
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {"type": "text", "text": "16th Street"}
                ],
                "type": "turn",
                "modifier": "left",
                "text": "16th Street"
              },
              "distanceAlongGeometry": 1147.047
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Continue for a half mile.</prosody></amazon:effect></speak>",
              "announcement": "Continue for a half mile.",
              "distanceAlongGeometry": 1136.38
            },
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">In a quarter mile, Turn left onto <say-as interpret-as=\"address\">16th Street</say-as>.</prosody></amazon:effect></speak>",
              "announcement": "In a quarter mile, Turn left onto 16th Street.",
              "distanceAlongGeometry": 402.336
            },
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Turn left onto <say-as interpret-as=\"address\">16th Street</say-as>.</prosody></amazon:effect></speak>",
              "announcement": "Turn left onto 16th Street.",
              "distanceAlongGeometry": 66.667
            }
          ],
          "intersections": [
            {
              "lanes": [
                {
                  "indications": ["left"],
                  "valid_indication": "left",
                  "valid": true,
                  "active": true
                },
                {
                  "indications": ["straight"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["straight"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["straight"],
                  "valid": false,
                  "active": false
                }
              ],
              "mapbox_streets_v8": {"class": "secondary"},
              "location": [-122.437676, 37.774066],
              "geometry_index": 13,
              "admin_index": 0,
              "weight": 14.464,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 7.622,
              "turn_weight": 12.5,
              "duration": 9.258,
              "bearings": [81, 170, 260, 352],
              "out": 1,
              "in": 0,
              "entry": [false, true, true, false]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [82, 171, 260, 350],
              "duration": 1.165,
              "turn_weight": 1,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 2.375,
              "geometry_index": 14,
              "location": [-122.437657, 37.773978]
            },
            {
              "entry": [true, true, false],
              "in": 2,
              "bearings": [171, 262, 351],
              "duration": 5.779,
              "turn_weight": 0.5,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 7.412,
              "geometry_index": 15,
              "location": [-122.437645, 37.773917]
            },
            {
              "entry": [true, true, false],
              "in": 2,
              "bearings": [171, 262, 351],
              "duration": 4.579,
              "turn_weight": 0.5,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 5.972,
              "geometry_index": 16,
              "location": [-122.437603, 37.773704]
            },
            {
              "entry": [true, true, false],
              "in": 2,
              "bearings": [171, 260, 351],
              "duration": 11.474,
              "turn_weight": 0.5,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 14.245,
              "geometry_index": 17,
              "location": [-122.437569, 37.773538]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [83, 171, 263, 351],
              "duration": 3.619,
              "turn_weight": 1,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 5.32,
              "geometry_index": 18,
              "location": [-122.437506, 37.773229]
            },
            {
              "mapbox_streets_v8": {"class": "secondary"},
              "location": [-122.437487, 37.773132],
              "geometry_index": 19,
              "admin_index": 0,
              "weight": 4.728,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.019,
              "turn_weight": 3,
              "duration": 3.459,
              "bearings": [82, 170, 260, 351],
              "out": 1,
              "in": 3,
              "entry": [true, true, false, false]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [80, 171, 260, 350],
              "duration": 15.679,
              "turn_weight": 1,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 19.792,
              "geometry_index": 20,
              "location": [-122.437471, 37.77306]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [82, 171, 260, 351],
              "duration": 1.639,
              "turn_weight": 1,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 2.944,
              "geometry_index": 22,
              "location": [-122.437315, 37.772286]
            },
            {
              "mapbox_streets_v8": {"class": "secondary"},
              "location": [-122.437299, 37.772202],
              "geometry_index": 23,
              "admin_index": 0,
              "weight": 3.287,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.019,
              "turn_weight": 1,
              "duration": 3.925,
              "bearings": [82, 170, 260, 351],
              "out": 1,
              "in": 3,
              "entry": [true, true, true, false]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [83, 171, 263, 350],
              "duration": 18.231,
              "turn_weight": 1,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 22.854,
              "geometry_index": 24,
              "location": [-122.437282, 37.772125]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [84, 171, 265, 351],
              "duration": 2.137,
              "turn_weight": 1,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 3.541,
              "geometry_index": 25,
              "location": [-122.437128, 37.77136]
            },
            {
              "mapbox_streets_v8": {"class": "secondary"},
              "location": [-122.43711, 37.771269],
              "geometry_index": 26,
              "admin_index": 0,
              "weight": 2.796,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.019,
              "turn_weight": 1.5,
              "duration": 3.099,
              "bearings": [82, 171, 260, 351],
              "out": 1,
              "in": 3,
              "entry": [true, true, true, false]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [79, 171, 259, 351],
              "duration": 8.899,
              "turn_weight": 1,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 11.656,
              "geometry_index": 27,
              "location": [-122.437094, 37.771192]
            },
            {
              "entry": [true, false],
              "in": 1,
              "bearings": [171, 351],
              "duration": 1.56,
              "turn_weight": 0.5,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 2.372,
              "geometry_index": 29,
              "location": [-122.436962, 37.770539]
            },
            {
              "lanes": [
                {
                  "indications": ["left"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["slight left", "straight"],
                  "valid_indication": "straight",
                  "valid": true,
                  "active": true
                }
              ],
              "location": [-122.436938, 37.77042],
              "geometry_index": 30,
              "admin_index": 0,
              "weight": 2.44,
              "is_urban": true,
              "mapbox_streets_v8": {"class": "secondary"},
              "turn_duration": 0.022,
              "turn_weight": 1,
              "duration": 1.222,
              "bearings": [82, 168, 260, 351],
              "out": 1,
              "in": 3,
              "entry": [false, true, false, false]
            },
            {
              "lanes": [
                {
                  "indications": ["left"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["slight left", "straight"],
                  "valid_indication": "straight",
                  "valid": true,
                  "active": true
                }
              ],
              "location": [-122.436915, 37.770335],
              "geometry_index": 32,
              "admin_index": 0,
              "weight": 3.16,
              "is_urban": true,
              "mapbox_streets_v8": {"class": "secondary"},
              "turn_duration": 0.097,
              "turn_weight": 1,
              "duration": 1.897,
              "bearings": [82, 146, 260, 348],
              "out": 1,
              "in": 3,
              "entry": [true, true, true, false]
            },
            {
              "lanes": [
                {
                  "indications": ["left"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["slight left", "straight"],
                  "valid_indication": "straight",
                  "valid": true,
                  "active": true
                }
              ],
              "location": [-122.436826, 37.770229],
              "geometry_index": 33,
              "admin_index": 0,
              "weight": 7.728,
              "is_urban": true,
              "mapbox_streets_v8": {"class": "secondary"},
              "turn_duration": 0.122,
              "turn_weight": 6,
              "duration": 1.562,
              "bearings": [0, 123, 177, 326],
              "out": 1,
              "in": 3,
              "entry": [true, true, true, false]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [6, 121, 184, 303],
              "duration": 7.701,
              "turn_weight": 1,
              "turn_duration": 0.021,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 10.216,
              "geometry_index": 34,
              "location": [-122.436709, 37.770169]
            },
            {
              "entry": [true, true, false],
              "in": 2,
              "bearings": [82, 151, 330],
              "duration": 10.133,
              "turn_weight": 0.5,
              "turn_duration": 0.008,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 12.65,
              "geometry_index": 41,
              "location": [-122.436225, 37.769758]
            },
            {
              "entry": [true, false],
              "in": 1,
              "bearings": [157, 333],
              "duration": 6.975,
              "turn_weight": 0.5,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 8.87,
              "geometry_index": 45,
              "location": [-122.435986, 37.769401]
            },
            {
              "lanes": [
                {
                  "indications": ["left"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["straight"],
                  "valid_indication": "straight",
                  "valid": true,
                  "active": true
                }
              ],
              "location": [-122.435851, 37.769147],
              "geometry_index": 49,
              "admin_index": 0,
              "weight": 3.7,
              "is_urban": true,
              "mapbox_streets_v8": {"class": "secondary"},
              "turn_duration": 0.011,
              "turn_weight": 1,
              "duration": 2.261,
              "bearings": [83, 164, 265, 337],
              "out": 1,
              "in": 3,
              "entry": [false, true, false, false]
            },
            {
              "lanes": [
                {
                  "indications": ["left"],
                  "valid": false,
                  "active": false
                },
                {
                  "indications": ["straight", "right"],
                  "valid_indication": "straight",
                  "valid": true,
                  "active": true
                }
              ],
              "mapbox_streets_v8": {"class": "secondary"},
              "location": [-122.435819, 37.769061],
              "geometry_index": 51,
              "admin_index": 0,
              "weight": 3.274,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.013,
              "turn_weight": 1,
              "duration": 3.907,
              "bearings": [86, 173, 266, 344],
              "out": 1,
              "in": 3,
              "entry": [true, true, true, false]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [89, 176, 267, 353],
              "duration": 6.072,
              "turn_weight": 1,
              "turn_duration": 0.008,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 8.276,
              "geometry_index": 53,
              "location": [-122.435806, 37.768975]
            },
            {
              "entry": [true, false],
              "in": 1,
              "bearings": [176, 356],
              "duration": 8.337,
              "turn_weight": 0.5,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 10.504,
              "geometry_index": 55,
              "location": [-122.435779, 37.768691]
            },
            {
              "entry": [false, true, false],
              "in": 2,
              "bearings": [84, 176, 356],
              "duration": 0.765,
              "turn_weight": 0.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 1.409,
              "geometry_index": 56,
              "location": [-122.435741, 37.768301]
            },
            {
              "entry": [true, true, false],
              "in": 2,
              "bearings": [84, 176, 356],
              "duration": 10.238,
              "turn_weight": 0.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 12.778,
              "geometry_index": 57,
              "location": [-122.435738, 37.768265]
            },
            {
              "entry": [true, false],
              "in": 1,
              "bearings": [176, 356],
              "duration": 7.768,
              "turn_weight": 0.5,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 9.822,
              "geometry_index": 58,
              "location": [-122.435691, 37.767783]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [86, 176, 266, 355],
              "duration": 1.713,
              "turn_weight": 1,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 3.046,
              "geometry_index": 61,
              "location": [-122.435655, 37.767419]
            },
            {
              "mapbox_streets_v8": {"class": "secondary"},
              "location": [-122.435648, 37.767336],
              "geometry_index": 62,
              "admin_index": 0,
              "weight": 2.94,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.019,
              "turn_weight": 1.5,
              "duration": 3.219,
              "bearings": [84, 175, 266, 356],
              "out": 1,
              "in": 3,
              "entry": [true, true, true, false]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [86, 176, 266, 355],
              "duration": 5.474,
              "turn_weight": 1,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 7.56,
              "geometry_index": 63,
              "location": [-122.43564, 37.767257]
            },
            {
              "entry": [true, false],
              "in": 1,
              "bearings": [176, 356],
              "duration": 4.267,
              "turn_weight": 0.5,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 5.62,
              "geometry_index": 64,
              "location": [-122.435605, 37.766894]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [89, 176, 266, 356],
              "duration": 0.94,
              "turn_weight": 1,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 2.12,
              "geometry_index": 65,
              "location": [-122.435577, 37.766603]
            },
            {
              "entry": [true, true, true, false],
              "in": 3,
              "bearings": [86, 176, 266, 356],
              "duration": 1.945,
              "turn_weight": 1,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 3.326,
              "geometry_index": 66,
              "location": [-122.435571, 37.766536]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [84, 176, 265, 356],
              "duration": 20.499,
              "turn_weight": 1,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 25.591,
              "geometry_index": 67,
              "location": [-122.435565, 37.76647]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [89, 176, 266, 356],
              "duration": 2.222,
              "turn_weight": 1,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 3.658,
              "geometry_index": 69,
              "location": [-122.435501, 37.76581]
            },
            {
              "mapbox_streets_v8": {"class": "secondary"},
              "location": [-122.435494, 37.765736],
              "geometry_index": 70,
              "admin_index": 0,
              "weight": 2.329,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.019,
              "turn_weight": 1,
              "duration": 3.127,
              "bearings": [86, 175, 265, 356],
              "out": 1,
              "in": 3,
              "entry": [true, true, true, false]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [86, 176, 267, 355],
              "duration": 10.669,
              "turn_weight": 1,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 13.794,
              "geometry_index": 71,
              "location": [-122.435486, 37.765665]
            },
            {
              "entry": [true, true, true, false],
              "in": 3,
              "bearings": [111, 176, 289, 356],
              "duration": 18.219,
              "turn_weight": 1,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 22.854,
              "geometry_index": 73,
              "location": [-122.435421, 37.764978]
            },
            {
              "bearings": [92, 176, 272, 355],
              "entry": [false, true, false, false],
              "in": 3,
              "turn_weight": 1,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 76,
              "location": [-122.435346, 37.764212]
            }
          ],
          "maneuver": {
            "type": "turn",
            "instruction": "Turn left onto Divisadero Street.",
            "modifier": "left",
            "bearing_after": 170,
            "bearing_before": 261,
            "location": [-122.437676, 37.774066]
          },
          "name": "Divisadero Street",
          "duration": 237.547,
          "distance": 1147.047,
          "driving_side": "right",
          "weight": 314.711,
          "mode": "driving",
          "geometry":
              "cnp`gAva_phFnDe@xBWhLsAjIcAhR}B`Ee@nC_@lJgA|c@oFfD_@xCa@xn@sHtDc@xC_@jIaAl]eElFo@RCtCi@rEqDvBiF`C_H~@sBjAeBvAcB`BwA~BcBlFmD`EiCjDuBxCaB`E{B`Bu@rEoBRIpD}AtAc@tA[nAOzAI|@ExNo@jWkAfAEb]}AxKg@dGWv@GdDM|COtUeAdQw@dCKbCKdf@yB`AErCMlCOr@Chh@}B|c@qB|G[~@G~CM"
        },
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {"type": "text", "text": "Dolores Street"}
                ],
                "type": "turn",
                "modifier": "right",
                "text": "Dolores Street"
              },
              "distanceAlongGeometry": 782.309
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Continue for a half mile.</prosody></amazon:effect></speak>",
              "announcement": "Continue for a half mile.",
              "distanceAlongGeometry": 772.309
            },
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">In a quarter mile, Turn right onto <say-as interpret-as=\"address\">Dolores Street</say-as>.</prosody></amazon:effect></speak>",
              "announcement":
                  "In a quarter mile, Turn right onto Dolores Street.",
              "distanceAlongGeometry": 402.336
            },
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Turn right onto <say-as interpret-as=\"address\">Dolores Street</say-as>.</prosody></amazon:effect></speak>",
              "announcement": "Turn right onto Dolores Street.",
              "distanceAlongGeometry": 66.667
            }
          ],
          "intersections": [
            {
              "entry": [true, true, true, false],
              "in": 3,
              "bearings": [97, 176, 277, 356],
              "duration": 6.313,
              "turn_weight": 12.5,
              "turn_duration": 3.913,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 15.38,
              "geometry_index": 77,
              "location": [-122.435339, 37.764132]
            },
            {
              "entry": [true, false, false, false],
              "in": 2,
              "bearings": [86, 177, 277, 356],
              "duration": 39.401,
              "turn_weight": 2,
              "turn_duration": 0.041,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 49.232,
              "geometry_index": 78,
              "location": [-122.435226, 37.764121]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [44, 88, 227, 266],
              "duration": 3.368,
              "turn_weight": 2,
              "turn_duration": 0.008,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 6.032,
              "geometry_index": 79,
              "location": [-122.433362, 37.764222]
            },
            {
              "mapbox_streets_v8": {"class": "street"},
              "location": [-122.433199, 37.764226],
              "geometry_index": 80,
              "admin_index": 0,
              "weight": 7.19,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.019,
              "turn_weight": 5.5,
              "duration": 3.428,
              "bearings": [44, 86, 224, 268],
              "out": 1,
              "in": 3,
              "entry": [false, true, true, false]
            },
            {
              "mapbox_streets_v8": {"class": "tertiary"},
              "location": [-122.433102, 37.764232],
              "geometry_index": 81,
              "admin_index": 0,
              "weight": 2.376,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.007,
              "turn_weight": 2,
              "duration": 2.32,
              "bearings": [87, 176, 266, 356],
              "out": 0,
              "in": 2,
              "entry": [true, true, false, true]
            },
            {
              "entry": [true, false],
              "in": 1,
              "bearings": [90, 267],
              "duration": 0.15,
              "turn_weight": 0.75,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 0.93,
              "geometry_index": 82,
              "railway_crossing": true,
              "location": [-122.433079, 37.764233]
            },
            {
              "mapbox_streets_v8": {"class": "tertiary"},
              "location": [-122.433076, 37.764233],
              "geometry_index": 83,
              "admin_index": 0,
              "weight": 6.865,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.028,
              "turn_weight": 6.2,
              "duration": 2.582,
              "bearings": [39, 85, 201, 270],
              "out": 1,
              "in": 3,
              "entry": [false, true, true, false]
            },
            {
              "entry": [true, false],
              "in": 1,
              "bearings": [86, 265],
              "duration": 0.831,
              "turn_weight": 0.75,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 1.747,
              "geometry_index": 84,
              "railway_crossing": true,
              "location": [-122.433031, 37.764236]
            },
            {
              "mapbox_streets_v8": {"class": "tertiary"},
              "location": [-122.43296, 37.76424],
              "geometry_index": 85,
              "admin_index": 0,
              "weight": 6.553,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.021,
              "turn_weight": 4,
              "duration": 4.148,
              "bearings": [44, 85, 222, 244, 266],
              "out": 1,
              "in": 4,
              "entry": [true, true, false, false, false]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [37, 86, 225, 265],
              "duration": 6.88,
              "turn_weight": 1.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 9.747,
              "geometry_index": 86,
              "location": [-122.432813, 37.76425]
            },
            {
              "entry": [true, false],
              "in": 1,
              "bearings": [85, 266],
              "duration": 0.655,
              "turn_weight": 0.75,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 1.535,
              "geometry_index": 87,
              "location": [-122.432342, 37.764279]
            },
            {
              "entry": [true, true, false],
              "in": 2,
              "bearings": [86, 176, 265],
              "duration": 2.274,
              "turn_weight": 0.75,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 3.47,
              "geometry_index": 88,
              "location": [-122.432298, 37.764282]
            },
            {
              "entry": [true, true, false],
              "in": 2,
              "bearings": [86, 175, 266],
              "duration": 3.955,
              "turn_weight": 0.75,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 5.488,
              "geometry_index": 89,
              "location": [-122.432106, 37.764293]
            },
            {
              "entry": [true, false, false],
              "in": 2,
              "bearings": [85, 175, 266],
              "duration": 12.421,
              "turn_weight": 0.75,
              "turn_duration": 0.021,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 15.63,
              "geometry_index": 90,
              "location": [-122.431716, 37.764317]
            },
            {
              "entry": [true, false, false, false],
              "in": 2,
              "bearings": [85, 175, 265, 355],
              "duration": 1.619,
              "turn_weight": 1.5,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 3.46,
              "geometry_index": 91,
              "location": [-122.431012, 37.764363]
            },
            {
              "mapbox_streets_v8": {"class": "tertiary"},
              "location": [-122.430916, 37.764369],
              "geometry_index": 92,
              "admin_index": 0,
              "weight": 3.46,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.007,
              "turn_weight": 1.5,
              "duration": 3.607,
              "bearings": [86, 177, 265, 356],
              "out": 0,
              "in": 2,
              "entry": [true, true, false, true]
            },
            {
              "entry": [true, false, false, false],
              "in": 2,
              "bearings": [86, 175, 266, 355],
              "duration": 7.74,
              "turn_weight": 1.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 10.973,
              "geometry_index": 93,
              "location": [-122.430785, 37.764377]
            },
            {
              "entry": [true, true, false],
              "in": 2,
              "bearings": [85, 176, 266],
              "duration": 3.283,
              "turn_weight": 0.75,
              "turn_duration": 0.021,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 4.747,
              "geometry_index": 94,
              "location": [-122.430123, 37.764416]
            },
            {
              "entry": [true, false, true],
              "in": 1,
              "bearings": [85, 265, 355],
              "duration": 3.739,
              "turn_weight": 0.75,
              "turn_duration": 0.019,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 5.307,
              "geometry_index": 95,
              "location": [-122.429794, 37.764437]
            },
            {
              "entry": [true, true, false],
              "in": 2,
              "bearings": [86, 175, 265],
              "duration": 12.607,
              "turn_weight": 0.75,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 16.185,
              "geometry_index": 96,
              "location": [-122.429441, 37.764459]
            },
            {
              "entry": [true, false, false, false],
              "in": 2,
              "bearings": [85, 175, 266, 356],
              "duration": 2.046,
              "turn_weight": 1.5,
              "turn_duration": 0.021,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 3.981,
              "geometry_index": 97,
              "location": [-122.428806, 37.764498]
            },
            {
              "entry": [true, false],
              "in": 1,
              "bearings": [86, 265],
              "duration": 0.18,
              "turn_weight": 0.75,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 0.971,
              "geometry_index": 98,
              "railway_crossing": true,
              "location": [-122.428699, 37.764505]
            },
            {
              "mapbox_streets_v8": {"class": "tertiary"},
              "location": [-122.42868, 37.764506],
              "geometry_index": 99,
              "admin_index": 0,
              "weight": 5.74,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.007,
              "turn_weight": 5.25,
              "duration": 2.407,
              "bearings": [86, 176, 266, 324, 356],
              "out": 0,
              "in": 2,
              "entry": [true, true, false, false, false]
            },
            {
              "entry": [true, false],
              "in": 1,
              "bearings": [86, 266],
              "duration": 0.8,
              "turn_weight": 0.75,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 1.73,
              "geometry_index": 100,
              "railway_crossing": true,
              "location": [-122.428661, 37.764507]
            },
            {
              "mapbox_streets_v8": {"class": "tertiary"},
              "location": [-122.428611, 37.76451],
              "geometry_index": 101,
              "admin_index": 0,
              "weight": 2.459,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.021,
              "turn_weight": 1.5,
              "duration": 2.803,
              "bearings": [84, 176, 266, 356],
              "out": 0,
              "in": 2,
              "entry": [true, false, false, true]
            },
            {
              "entry": [true, false, false, false],
              "in": 2,
              "bearings": [86, 175, 264, 356],
              "duration": 4.547,
              "turn_weight": 1.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 7.06,
              "geometry_index": 102,
              "location": [-122.42856, 37.764514]
            },
            {
              "entry": [true, false, false],
              "in": 2,
              "bearings": [86, 172, 266],
              "duration": 7.087,
              "turn_weight": 0.75,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 9.423,
              "geometry_index": 104,
              "location": [-122.428226, 37.764533]
            },
            {
              "entry": [true, false, false],
              "in": 1,
              "bearings": [86, 266, 356],
              "duration": 16.491,
              "turn_weight": 0.75,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 20.943,
              "geometry_index": 105,
              "location": [-122.42756, 37.764574]
            },
            {
              "bearings": [85, 173, 266, 353],
              "entry": [true, false, false, false],
              "in": 2,
              "turn_weight": 1.5,
              "turn_duration": 0.021,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 107,
              "location": [-122.426571, 37.764633]
            }
          ],
          "maneuver": {
            "type": "turn",
            "instruction": "Turn left onto 16th Street.",
            "modifier": "left",
            "bearing_after": 97,
            "bearing_before": 176,
            "location": [-122.435339, 37.764132]
          },
          "name": "16th Street",
          "duration": 159.22,
          "distance": 782.309,
          "driving_side": "right",
          "weight": 231.97,
          "mode": "driving",
          "geometry":
              "ga}_gAtozohFTaFiEosBGeIKaEAm@?EEyAGmCSeHy@m\\EwAU_Ko@kW{A_k@K_EOeGmAkh@i@qSk@aUmAuf@MuEAe@Ae@EcBGeBGuC]eOqAsh@oBcz@EuAK_E"
        },
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {"type": "text", "text": "17th Street"}
                ],
                "type": "turn",
                "modifier": "left",
                "text": "17th Street"
              },
              "distanceAlongGeometry": 180.638
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">In 600 feet, Turn left onto <say-as interpret-as=\"address\">17th Street</say-as>.</prosody></amazon:effect></speak>",
              "announcement": "In 600 feet, Turn left onto 17th Street.",
              "distanceAlongGeometry": 167.305
            },
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Turn left onto <say-as interpret-as=\"address\">17th Street</say-as>.</prosody></amazon:effect></speak>",
              "announcement": "Turn left onto 17th Street.",
              "distanceAlongGeometry": 66.667
            }
          ],
          "intersections": [
            {
              "mapbox_streets_v8": {"class": "tertiary"},
              "location": [-122.426475, 37.764639],
              "geometry_index": 108,
              "admin_index": 0,
              "weight": 8.102,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 4.105,
              "turn_weight": 7,
              "duration": 5.005,
              "bearings": [86, 175, 265, 356],
              "out": 1,
              "in": 2,
              "entry": [true, true, false, false]
            },
            {
              "entry": [false, true, false, false],
              "in": 3,
              "bearings": [86, 176, 266, 355],
              "duration": 7.77,
              "turn_weight": 1.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 11.009,
              "geometry_index": 109,
              "location": [-122.426467, 37.764564]
            },
            {
              "entry": [true, true, false, false],
              "in": 3,
              "bearings": [76, 176, 256, 356],
              "duration": 5.069,
              "turn_weight": 1.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "weight": 7.702,
              "geometry_index": 110,
              "location": [-122.426408, 37.76395]
            },
            {
              "bearings": [87, 176, 356],
              "entry": [true, true, false],
              "in": 2,
              "turn_weight": 1,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 111,
              "location": [-122.426369, 37.763543]
            }
          ],
          "maneuver": {
            "type": "turn",
            "instruction": "Turn right onto Dolores Street.",
            "modifier": "right",
            "bearing_after": 175,
            "bearing_before": 85,
            "location": [-122.426475, 37.764639]
          },
          "name": "Dolores Street",
          "duration": 29.452,
          "distance": 180.638,
          "driving_side": "right",
          "weight": 42.023,
          "mode": "driving",
          "geometry": "}`~_gAteiohFtCOje@uBlXmAr_@cB"
        },
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {"type": "text", "text": "Guerrero Street"}
                ],
                "type": "turn",
                "modifier": "left",
                "text": "Guerrero Street"
              },
              "distanceAlongGeometry": 212.636
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">In 700 feet, Turn left onto <say-as interpret-as=\"address\">Guerrero Street</say-as>.</prosody></amazon:effect></speak>",
              "announcement": "In 700 feet, Turn left onto Guerrero Street.",
              "distanceAlongGeometry": 186.159
            },
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Turn left onto <say-as interpret-as=\"address\">Guerrero Street</say-as>.</prosody></amazon:effect></speak>",
              "announcement": "Turn left onto Guerrero Street.",
              "distanceAlongGeometry": 75.229
            }
          ],
          "intersections": [
            {
              "mapbox_streets_v8": {"class": "tertiary"},
              "location": [-122.426319, 37.763021],
              "geometry_index": 112,
              "admin_index": 0,
              "weight": 13.372,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 7.395,
              "turn_weight": 10,
              "duration": 10.148,
              "bearings": [86, 176, 266, 356],
              "out": 0,
              "in": 3,
              "entry": [true, true, true, false]
            },
            {
              "mapbox_streets_v8": {"class": "tertiary"},
              "location": [-122.42617, 37.763029],
              "geometry_index": 113,
              "admin_index": 0,
              "weight": 40.22,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.021,
              "turn_weight": 2,
              "duration": 33.221,
              "bearings": [85, 176, 266, 356],
              "out": 0,
              "in": 2,
              "entry": [true, false, false, true]
            },
            {
              "entry": [true, false, false, false],
              "in": 2,
              "bearings": [87, 176, 266, 356],
              "duration": 1.55,
              "turn_weight": 1.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 3.39,
              "geometry_index": 115,
              "location": [-122.424111, 37.763157]
            },
            {
              "bearings": [86, 176, 267, 356],
              "entry": [true, true, false, false],
              "in": 2,
              "turn_weight": 3,
              "turn_duration": 2.019,
              "traffic_signal": true,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 116,
              "location": [-122.424007, 37.763162]
            }
          ],
          "maneuver": {
            "type": "turn",
            "instruction": "Turn left onto 17th Street.",
            "modifier": "left",
            "bearing_after": 85,
            "bearing_before": 176,
            "location": [-122.426319, 37.763021]
          },
          "name": "17th Street",
          "duration": 49.098,
          "distance": 212.636,
          "driving_side": "right",
          "weight": 62.628,
          "mode": "driving",
          "geometry": "y{z_gA|{hohFOiHoDetAoAoj@IoEKaE"
        },
        {
          "bannerInstructions": [
            {
              "primary": {
                "components": [
                  {
                    "type": "text",
                    "text": "Your destination will be on the right"
                  }
                ],
                "type": "arrive",
                "modifier": "right",
                "text": "Your destination will be on the right"
              },
              "distanceAlongGeometry": 267.825
            },
            {
              "primary": {
                "components": [
                  {"type": "text", "text": "Your destination is on the right"}
                ],
                "type": "arrive",
                "modifier": "right",
                "text": "Your destination is on the right"
              },
              "distanceAlongGeometry": 55.556
            }
          ],
          "voiceInstructions": [
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">In 900 feet, Your destination will be on the right.</prosody></amazon:effect></speak>",
              "announcement":
                  "In 900 feet, Your destination will be on the right.",
              "distanceAlongGeometry": 254.492
            },
            {
              "ssmlAnnouncement":
                  "<speak><amazon:effect name=\"drc\"><prosody rate=\"1.08\">Your destination is on the right.</prosody></amazon:effect></speak>",
              "announcement": "Your destination is on the right.",
              "distanceAlongGeometry": 55.556
            }
          ],
          "intersections": [
            {
              "mapbox_streets_v8": {"class": "secondary"},
              "location": [-122.42391, 37.763168],
              "geometry_index": 117,
              "admin_index": 0,
              "weight": 22.425,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 7.395,
              "turn_weight": 18.75,
              "duration": 10.395,
              "bearings": [86, 176, 266, 356],
              "out": 3,
              "in": 2,
              "entry": [true, false, false, true]
            },
            {
              "entry": [false, false, false, true],
              "in": 1,
              "bearings": [86, 176, 265, 356],
              "duration": 23.707,
              "turn_weight": 1,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 3,
              "weight": 30.033,
              "geometry_index": 118,
              "location": [-122.423919, 37.763262]
            },
            {
              "entry": [true, false, true],
              "in": 1,
              "bearings": [87, 176, 356],
              "duration": 18.989,
              "turn_weight": 0.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "weight": 23.753,
              "geometry_index": 119,
              "location": [-122.423984, 37.763973]
            },
            {
              "entry": [false, false, true],
              "in": 1,
              "bearings": [89, 176, 356],
              "duration": 8.189,
              "turn_weight": 0.5,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "weight": 10.523,
              "geometry_index": 120,
              "location": [-122.424026, 37.764493]
            },
            {
              "entry": [false, false, false, true],
              "in": 1,
              "bearings": [83, 176, 263, 356],
              "duration": 2.952,
              "turn_weight": 1,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 3,
              "weight": 4.608,
              "geometry_index": 121,
              "location": [-122.424045, 37.764717]
            },
            {
              "mapbox_streets_v8": {"class": "secondary"},
              "location": [-122.424052, 37.764794],
              "geometry_index": 122,
              "admin_index": 0,
              "weight": 4.854,
              "is_urban": true,
              "traffic_signal": true,
              "turn_duration": 2.019,
              "turn_weight": 2,
              "duration": 4.349,
              "bearings": [87, 176, 265, 355],
              "out": 3,
              "in": 1,
              "entry": [true, false, true, true]
            },
            {
              "bearings": [84, 175, 265, 355],
              "entry": [false, false, false, true],
              "in": 1,
              "turn_weight": 1,
              "turn_duration": 0.007,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 3,
              "geometry_index": 123,
              "location": [-122.424062, 37.76489]
            }
          ],
          "maneuver": {
            "type": "turn",
            "instruction": "Turn left onto Guerrero Street.",
            "modifier": "left",
            "bearing_after": 356,
            "bearing_before": 86,
            "location": [-122.42391, 37.763168]
          },
          "name": "Guerrero Street",
          "duration": 84.61,
          "distance": 267.825,
          "driving_side": "right",
          "weight": 116.823,
          "mode": "driving",
          "geometry": "_e{_gAjedohF{DPmk@`Co_@rA_Md@yCL_ERki@fC"
        },
        {
          "bannerInstructions": [],
          "voiceInstructions": [],
          "intersections": [
            {
              "bearings": [175],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 124,
              "location": [-122.42413, 37.765568]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "Your destination is on the right.",
            "modifier": "right",
            "bearing_after": 0,
            "bearing_before": 355,
            "location": [-122.42413, 37.765568]
          },
          "name": "Guerrero Street",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "_{_`gAbsdohF??"
        }
      ],
      "distance": 2794.409,
      "summary": "Divisadero Street, 16th Street"
    }
  ],
  "geometry": "i`q`gAvrzohFdQ~mCdhFqn@rWqa@~u@}`@`sH_]u^_iPbdBwHeHquC_uCvL",
  "voiceLocale": "en-US"
};
