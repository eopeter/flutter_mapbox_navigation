const predefinedRouteExample = {
  "confidence": 0.980362,
  "weight_name": "auto",
  "weight": 427.189,
  "duration": 392.679,
  "distance": 2774.477,
  "legs": [
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 22.794,
      "duration": 20.756,
      "steps": [
        {
          "intersections": [
            {
              "entry": [true],
              "bearings": [165],
              "duration": 6.756,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "weight": 7.094,
              "geometry_index": 0,
              "location": [9.150338, 45.580615]
            },
            {
              "bearings": [165, 345],
              "entry": [true, false],
              "in": 1,
              "turn_weight": 1,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 1,
              "location": [9.150453, 45.580321]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Via Sempione.",
            "bearing_after": 165,
            "bearing_before": 0,
            "location": [9.150338, 45.580615]
          },
          "name": "Via Sempione",
          "duration": 20.756,
          "distance": 103.746,
          "driving_side": "right",
          "weight": 22.794,
          "mode": "driving",
          "geometry": "ms_}uAcwnmPjQeFxd@wM"
        },
        {
          "intersections": [
            {
              "bearings": [345],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.150689, 45.579716]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 165,
            "location": [9.150689, 45.579716]
          },
          "name": "Via Sempione",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "g{}|uAamomP??"
        }
      ],
      "distance": 103.746,
      "summary": "Via Sempione"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 12.685,
      "duration": 11.8,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [167],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.150689, 45.579716]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive south on Via Sempione.",
            "bearing_after": 167,
            "bearing_before": 0,
            "location": [9.150689, 45.579716]
          },
          "name": "Via Sempione",
          "duration": 11.8,
          "distance": 59.183,
          "driving_side": "right",
          "weight": 12.685,
          "mode": "driving",
          "geometry": "g{}|uAamomPj_@uI"
        },
        {
          "intersections": [
            {
              "bearings": [347],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.15086, 45.579198]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 167,
            "location": [9.15086, 45.579198]
          },
          "name": "Via Sempione",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "{z||uAwwomP??"
        }
      ],
      "distance": 59.183,
      "summary": "Via Sempione"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.987,
      "duration": 1.849,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [276],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.15086, 45.579198]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Magenta/SP119.",
            "bearing_after": 276,
            "bearing_before": 0,
            "location": [9.15086, 45.579198]
          },
          "name": "Via Magenta",
          "duration": 1.849,
          "distance": 18.958,
          "driving_side": "right",
          "weight": 1.987,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "{z||uAwwomPEtC[lI"
        },
        {
          "intersections": [
            {
              "bearings": [96],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.150618, 45.579215]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 276,
            "location": [9.150618, 45.579215]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "}{||uAshomP??"
        }
      ],
      "distance": 18.958,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 2.955,
      "duration": 2.749,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [278],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.150618, 45.579215]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Magenta/SP119.",
            "bearing_after": 278,
            "bearing_before": 0,
            "location": [9.150618, 45.579215]
          },
          "name": "Via Magenta",
          "duration": 2.749,
          "distance": 27.98,
          "driving_side": "right",
          "weight": 2.955,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "}{||uAshomPaAfU"
        },
        {
          "intersections": [
            {
              "bearings": [98],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.150262, 45.579248]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 278,
            "location": [9.150262, 45.579248]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "_~||uAkrnmP??"
        }
      ],
      "distance": 27.98,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.228,
      "duration": 1.143,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [273],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.150262, 45.579248]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Magenta/SP119.",
            "bearing_after": 273,
            "bearing_before": 0,
            "location": [9.150262, 45.579248]
          },
          "name": "Via Magenta",
          "duration": 1.143,
          "distance": 11.629,
          "driving_side": "right",
          "weight": 1.228,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "_~||uAkrnmPKhH"
        },
        {
          "intersections": [
            {
              "bearings": [93],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.150113, 45.579254]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 273,
            "location": [9.150113, 45.579254]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "k~||uAainmP??"
        }
      ],
      "distance": 11.629,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.232,
      "duration": 0.216,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [261],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.150113, 45.579254]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Magenta/SP119.",
            "bearing_after": 261,
            "bearing_before": 0,
            "location": [9.150113, 45.579254]
          },
          "name": "Via Magenta",
          "duration": 0.216,
          "distance": 3.473,
          "driving_side": "right",
          "weight": 0.232,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "k~||uAainmPHvA"
        },
        {
          "intersections": [
            {
              "bearings": [81],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.150069, 45.579249]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 261,
            "location": [9.150069, 45.579249]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "a~||uAifnmP??"
        }
      ],
      "distance": 3.473,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.548,
      "duration": 0.522,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [260],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.150069, 45.579249]
            },
            {
              "bearings": [80, 260, 345],
              "entry": [false, true, true],
              "in": 0,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": false,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.150069, 45.579249]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Magenta/SP119.",
            "bearing_after": 260,
            "bearing_before": 0,
            "location": [9.150069, 45.579249]
          },
          "name": "Via Magenta",
          "duration": 0.522,
          "distance": 5.602,
          "driving_side": "right",
          "weight": 0.548,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "a~||uAifnmP??PlC"
        },
        {
          "intersections": [
            {
              "bearings": [80],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.149998, 45.57924]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 260,
            "location": [9.149998, 45.57924]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "o}||uA{anmP??"
        }
      ],
      "distance": 5.602,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 3.911,
      "duration": 3.725,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [255],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.149998, 45.57924]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Magenta/SP119.",
            "bearing_after": 255,
            "bearing_before": 0,
            "location": [9.149998, 45.57924]
          },
          "name": "Via Magenta",
          "duration": 3.725,
          "distance": 40,
          "driving_side": "right",
          "weight": 3.911,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "o}||uA{anmPvD~]"
        },
        {
          "intersections": [
            {
              "bearings": [75],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.149502, 45.579148]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 255,
            "location": [9.149502, 45.579148]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "ww||uA{bmmP??"
        }
      ],
      "distance": 40,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 3.183,
      "duration": 3.032,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [254],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.149502, 45.579148]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Magenta/SP119.",
            "bearing_after": 254,
            "bearing_before": 0,
            "location": [9.149502, 45.579148]
          },
          "name": "Via Magenta",
          "duration": 3.032,
          "distance": 32.158,
          "driving_side": "right",
          "weight": 3.183,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "ww||uA{bmmP|CxW"
        },
        {
          "intersections": [
            {
              "bearings": [74],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.149105, 45.579069]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 254,
            "location": [9.149105, 45.579069]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "yr||uAajlmP??"
        }
      ],
      "distance": 32.158,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.969,
      "duration": 0.923,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [255],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.149105, 45.579069]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Magenta/SP119.",
            "bearing_after": 255,
            "bearing_before": 0,
            "location": [9.149105, 45.579069]
          },
          "name": "Via Magenta",
          "duration": 0.923,
          "distance": 10.475,
          "driving_side": "right",
          "weight": 0.969,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "yr||uAajlmPn@bG"
        },
        {
          "intersections": [
            {
              "bearings": [75],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.148975, 45.579045]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 255,
            "location": [9.148975, 45.579045]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "iq||uA}almP??"
        }
      ],
      "distance": 10.475,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 4.471,
      "duration": 4.258,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [254],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.148975, 45.579045]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Magenta/SP119.",
            "bearing_after": 254,
            "bearing_before": 0,
            "location": [9.148975, 45.579045]
          },
          "name": "Via Magenta",
          "duration": 4.258,
          "distance": 47.344,
          "driving_side": "right",
          "weight": 4.471,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "iq||uA}almPdFpc@"
        },
        {
          "intersections": [
            {
              "bearings": [74],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.14839, 45.57893]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 254,
            "location": [9.14839, 45.57893]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "cj||uAk}jmP??"
        }
      ],
      "distance": 47.344,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 4.979,
      "duration": 4.742,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [254],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.14839, 45.57893]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Magenta/SP119.",
            "bearing_after": 254,
            "bearing_before": 0,
            "location": [9.14839, 45.57893]
          },
          "name": "Via Magenta",
          "duration": 4.742,
          "distance": 52.717,
          "driving_side": "right",
          "weight": 4.979,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "cj||uAk}jmP`Gtg@"
        },
        {
          "intersections": [
            {
              "bearings": [74],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.147739, 45.578801]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 254,
            "location": [9.147739, 45.578801]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "ab||uAutimP??"
        }
      ],
      "distance": 52.717,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 6.524,
      "duration": 6.069,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [255],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.147739, 45.578801]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Magenta/SP119.",
            "bearing_after": 255,
            "bearing_before": 0,
            "location": [9.147739, 45.578801]
          },
          "name": "Via Magenta",
          "duration": 6.069,
          "distance": 59.351,
          "driving_side": "right",
          "weight": 6.524,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "ab||uAutimPvG|l@"
        },
        {
          "intersections": [
            {
              "bearings": [75],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.147004, 45.578661]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 255,
            "location": [9.147004, 45.578661]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "iy{|uAwfhmP??"
        }
      ],
      "distance": 59.351,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 2.15,
      "duration": 2,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [254],
              "entry": [true],
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.147004, 45.578661]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Magenta/SP119.",
            "bearing_after": 254,
            "bearing_before": 0,
            "location": [9.147004, 45.578661]
          },
          "name": "Via Magenta",
          "duration": 2,
          "distance": 14.692,
          "driving_side": "right",
          "weight": 2.15,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "iy{|uAwfhmPhAhJ"
        },
        {
          "intersections": [
            {
              "bearings": [74],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.146823, 45.578624]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 254,
            "location": [9.146823, 45.578624]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "_w{|uAm{gmP??"
        }
      ],
      "distance": 14.692,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 2.972,
      "duration": 2.765,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [256],
              "entry": [true],
              "yield_sign": true,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.146823, 45.578624]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Magenta/SP119.",
            "bearing_after": 256,
            "bearing_before": 0,
            "location": [9.146823, 45.578624]
          },
          "name": "Via Magenta",
          "duration": 2.765,
          "distance": 13.153,
          "driving_side": "right",
          "weight": 2.972,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "_w{|uAm{gmPv@fI"
        },
        {
          "intersections": [
            {
              "bearings": [76],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.146659, 45.578596]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 256,
            "location": [9.146659, 45.578596]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "gu{|uAeqgmP??"
        }
      ],
      "distance": 13.153,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 2.981,
      "duration": 2.773,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [254],
              "entry": [true],
              "yield_sign": true,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.146659, 45.578596]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Magenta/SP119.",
            "bearing_after": 254,
            "bearing_before": 0,
            "location": [9.146659, 45.578596]
          },
          "name": "Via Magenta",
          "duration": 2.773,
          "distance": 13.19,
          "driving_side": "right",
          "weight": 2.981,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "gu{|uAeqgmP~@dI"
        },
        {
          "intersections": [
            {
              "bearings": [74],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.146496, 45.578564]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 254,
            "location": [9.146496, 45.578564]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "gs{|uA_ggmP??"
        }
      ],
      "distance": 13.19,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 4.534,
      "duration": 4.218,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [254],
              "entry": [true],
              "yield_sign": true,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.146496, 45.578564]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Magenta/SP119.",
            "bearing_after": 254,
            "bearing_before": 0,
            "location": [9.146496, 45.578564]
          },
          "name": "Via Magenta",
          "duration": 4.218,
          "distance": 20.065,
          "driving_side": "right",
          "weight": 4.534,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "gs{|uA_ggmPdBlN"
        },
        {
          "intersections": [
            {
              "bearings": [74],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.146249, 45.578513]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 254,
            "location": [9.146249, 45.578513]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "ap{|uAqwfmP??"
        }
      ],
      "distance": 20.065,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.578,
      "duration": 1.468,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [239],
              "entry": [true],
              "yield_sign": true,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.146249, 45.578513]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive southwest on Via Magenta/SP119.",
            "bearing_after": 239,
            "bearing_before": 0,
            "location": [9.146249, 45.578513]
          },
          "name": "Via Magenta",
          "duration": 1.468,
          "distance": 6.983,
          "driving_side": "right",
          "weight": 1.578,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "ap{|uAqwfmP~@xC"
        },
        {
          "intersections": [
            {
              "bearings": [59],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.146172, 45.578481]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 239,
            "location": [9.146172, 45.578481]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "an{|uAwrfmP??"
        }
      ],
      "distance": 6.983,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.138,
      "duration": 1.059,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [254],
              "entry": [true],
              "yield_sign": true,
              "mapbox_streets_v8": {"class": "tertiary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.146172, 45.578481]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Magenta/SP119.",
            "bearing_after": 254,
            "bearing_before": 0,
            "location": [9.146172, 45.578481]
          },
          "name": "Via Magenta",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "an{|uAwrfmP??"
        },
        {
          "intersections": [
            {
              "bearings": [74, 137, 254],
              "entry": [false, false, true],
              "in": 0,
              "mapbox_streets_v8": {"class": "roundabout"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 1,
              "location": [9.146172, 45.578481]
            }
          ],
          "maneuver": {
            "type": "roundabout",
            "exit": 1,
            "instruction": "Enter the roundabout and take the 1st exit.",
            "modifier": "straight",
            "bearing_after": 254,
            "bearing_before": 254,
            "location": [9.146172, 45.578481]
          },
          "name": "",
          "duration": 1.059,
          "distance": 5.118,
          "driving_side": "right",
          "weight": 1.138,
          "mode": "driving",
          "geometry": "an{|uAwrfmPX|B"
        },
        {
          "intersections": [
            {
              "bearings": [74],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.146109, 45.578468]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 254,
            "location": [9.146109, 45.578468]
          },
          "name": "",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "gm{|uAynfmP??"
        }
      ],
      "distance": 5.118,
      "summary": "Via Magenta"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.441,
      "duration": 1.341,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [298],
              "entry": [true],
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.146109, 45.578468]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive northwest on Via Reali/SP119.",
            "bearing_after": 298,
            "bearing_before": 0,
            "location": [9.146109, 45.578468]
          },
          "name": "Via Reali",
          "duration": 1.341,
          "distance": 7.14,
          "driving_side": "right",
          "weight": 1.441,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "gm{|uAynfmP{@`D"
        },
        {
          "intersections": [
            {
              "bearings": [118],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.146028, 45.578498]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 298,
            "location": [9.146028, 45.578498]
          },
          "name": "Via Reali",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "co{|uAwifmP??"
        }
      ],
      "distance": 7.14,
      "summary": "Via Reali"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 2.021,
      "duration": 1.88,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [311],
              "entry": [true],
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.146028, 45.578498]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive northwest on Via Reali/SP119.",
            "bearing_after": 311,
            "bearing_before": 0,
            "location": [9.146028, 45.578498]
          },
          "name": "Via Reali",
          "duration": 1.88,
          "distance": 10.013,
          "driving_side": "right",
          "weight": 2.021,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "co{|uAwifmPuB`E"
        },
        {
          "intersections": [
            {
              "bearings": [131],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.145931, 45.578557]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 311,
            "location": [9.145931, 45.578557]
          },
          "name": "Via Reali",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "yr{|uAucfmP??"
        }
      ],
      "distance": 10.013,
      "summary": "Via Reali"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 20.64,
      "duration": 19.2,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [350],
              "entry": [true],
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.145931, 45.578557]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive north on Via Comasina/SP119.",
            "bearing_after": 350,
            "bearing_before": 0,
            "location": [9.145931, 45.578557]
          },
          "name": "Via Comasina",
          "duration": 19.2,
          "distance": 63.931,
          "driving_side": "right",
          "weight": 20.64,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "yr{|uAucfmPkb@tG"
        },
        {
          "intersections": [
            {
              "bearings": [170],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.145792, 45.579123]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 350,
            "location": [9.145792, 45.579123]
          },
          "name": "Via Comasina",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "ev||uA_{emP??"
        }
      ],
      "distance": 63.931,
      "summary": "Via Comasina"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 22.944,
      "duration": 21.344,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [350],
              "entry": [true],
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.145792, 45.579123]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive north on Via Comasina/SP119.",
            "bearing_after": 350,
            "bearing_before": 0,
            "location": [9.145792, 45.579123]
          },
          "name": "Via Comasina",
          "duration": 21.344,
          "distance": 71.37,
          "driving_side": "right",
          "weight": 22.944,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "ev||uA_{emPof@rH"
        },
        {
          "intersections": [
            {
              "bearings": [170],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.145638, 45.579755]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 350,
            "location": [9.145638, 45.579755]
          },
          "name": "Via Comasina",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "u}}|uAkqemP??"
        }
      ],
      "distance": 71.37,
      "summary": "Via Comasina"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 2.856,
      "duration": 2.656,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [352],
              "entry": [true],
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.145638, 45.579755]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive north on Via Comasina/SP119.",
            "bearing_after": 352,
            "bearing_before": 0,
            "location": [9.145638, 45.579755]
          },
          "name": "Via Comasina",
          "duration": 2.656,
          "distance": 8.882,
          "driving_side": "right",
          "weight": 2.856,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "u}}|uAkqemP}C^"
        },
        {
          "intersections": [
            {
              "bearings": [172],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.145622, 45.579834]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 352,
            "location": [9.145622, 45.579834]
          },
          "name": "Via Comasina",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "sb~|uAkpemP??"
        }
      ],
      "distance": 8.882,
      "summary": "Via Comasina"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.788,
      "duration": 1.663,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [351],
              "entry": [true],
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.145622, 45.579834]
            },
            {
              "bearings": [101, 171, 351],
              "entry": [true, false, true],
              "in": 1,
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 1,
              "location": [9.145622, 45.579834]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive north on Via Comasina/SP119.",
            "bearing_after": 351,
            "bearing_before": 0,
            "location": [9.145622, 45.579834]
          },
          "name": "Via Comasina",
          "duration": 1.663,
          "distance": 5.522,
          "driving_side": "right",
          "weight": 1.788,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "sb~|uAkpemP??aBT"
        },
        {
          "intersections": [
            {
              "bearings": [171],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.145611, 45.579883]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 351,
            "location": [9.145611, 45.579883]
          },
          "name": "Via Comasina",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "ue~|uAuoemP??"
        }
      ],
      "distance": 5.522,
      "summary": "Via Comasina"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 8.209,
      "duration": 7.637,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [353],
              "entry": [true],
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.145611, 45.579883]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive north on Via Comasina/SP119.",
            "bearing_after": 353,
            "bearing_before": 0,
            "location": [9.145611, 45.579883]
          },
          "name": "Via Comasina",
          "duration": 7.637,
          "distance": 25.351,
          "driving_side": "right",
          "weight": 8.209,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "ue~|uAuoemPcMnA"
        },
        {
          "intersections": [
            {
              "bearings": [173],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.145571, 45.580109]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 353,
            "location": [9.145571, 45.580109]
          },
          "name": "Via Comasina",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "ref": "SP119",
          "geometry": "ys~|uAememP??"
        }
      ],
      "distance": 25.351,
      "summary": "Via Comasina"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 5.815,
      "duration": 5.538,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [359],
              "entry": [true],
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.145571, 45.580109]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive north on Via Castelletto.",
            "bearing_after": 359,
            "bearing_before": 0,
            "location": [9.145571, 45.580109]
          },
          "name": "Via Castelletto",
          "duration": 5.538,
          "distance": 20.043,
          "driving_side": "right",
          "weight": 5.815,
          "mode": "driving",
          "geometry": "ys~|uAememPgJJ"
        },
        {
          "intersections": [
            {
              "bearings": [179],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.145565, 45.580289]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 359,
            "location": [9.145565, 45.580289]
          },
          "name": "Via Castelletto",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "a__}uAylemP??"
        }
      ],
      "distance": 20.043,
      "summary": "Via Castelletto"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 2.003,
      "duration": 1.908,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [359],
              "entry": [true],
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.145565, 45.580289]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive north on Via Castelletto.",
            "bearing_after": 359,
            "bearing_before": 0,
            "location": [9.145565, 45.580289]
          },
          "name": "Via Castelletto",
          "duration": 1.908,
          "distance": 6.904,
          "driving_side": "right",
          "weight": 2.003,
          "mode": "driving",
          "geometry": "a__}uAylemP{BB"
        },
        {
          "intersections": [
            {
              "bearings": [179],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.145563, 45.580351]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 359,
            "location": [9.145563, 45.580351]
          },
          "name": "Via Castelletto",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "}b_}uAulemP??"
        }
      ],
      "distance": 6.904,
      "summary": "Via Castelletto"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 37.757,
      "duration": 35.959,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [0],
              "entry": [true],
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.145563, 45.580351]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive north on Via Castelletto.",
            "bearing_after": 0,
            "bearing_before": 0,
            "location": [9.145563, 45.580351]
          },
          "name": "Via Castelletto",
          "duration": 35.959,
          "distance": 130.133,
          "driving_side": "right",
          "weight": 37.757,
          "mode": "driving",
          "geometry": "}b_}uAulemPahAG"
        },
        {
          "intersections": [
            {
              "bearings": [180],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.145567, 45.58152]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 0,
            "location": [9.145567, 45.58152]
          },
          "name": "Via Castelletto",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "_la}uA}lemP??"
        }
      ],
      "distance": 130.133,
      "summary": "Via Castelletto"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 4.893,
      "duration": 4.66,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [4],
              "entry": [true],
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.145567, 45.58152]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive north on Via Castelletto.",
            "bearing_after": 4,
            "bearing_before": 0,
            "location": [9.145567, 45.58152]
          },
          "name": "Via Castelletto",
          "duration": 4.66,
          "distance": 16.863,
          "driving_side": "right",
          "weight": 4.893,
          "mode": "driving",
          "geometry": "_la}uA}lemPwBIaBOsAE"
        },
        {
          "intersections": [
            {
              "bearings": [184],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 3,
              "location": [9.145583, 45.581671]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 4,
            "location": [9.145583, 45.581671]
          },
          "name": "Via Castelletto",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "mua}uA}memP??"
        }
      ],
      "distance": 16.863,
      "summary": "Via Castelletto"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 6.427,
      "duration": 6.121,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [0],
              "entry": [true],
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.145583, 45.581671]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive north on Via Castelletto.",
            "bearing_after": 0,
            "bearing_before": 0,
            "location": [9.145583, 45.581671]
          },
          "name": "Via Castelletto",
          "duration": 6.121,
          "distance": 22.153,
          "driving_side": "right",
          "weight": 6.427,
          "mode": "driving",
          "geometry": "mua}uA}memP_FAmDA"
        },
        {
          "intersections": [
            {
              "bearings": [180],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.145585, 45.58187]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 0,
            "location": [9.145585, 45.58187]
          },
          "name": "Via Castelletto",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "{ab}uAanemP??"
        }
      ],
      "distance": 22.153,
      "summary": "Via Castelletto"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 8.528,
      "duration": 8.121,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [1],
              "entry": [true],
              "mapbox_streets_v8": {"class": "secondary"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.145585, 45.58187]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive north on Via Castelletto.",
            "bearing_after": 1,
            "bearing_before": 0,
            "location": [9.145585, 45.58187]
          },
          "name": "Via Castelletto",
          "duration": 8.121,
          "distance": 29.391,
          "driving_side": "right",
          "weight": 8.528,
          "mode": "driving",
          "geometry": "{ab}uAanemPoOI"
        },
        {
          "intersections": [
            {
              "bearings": [181],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.14559, 45.582134]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 1,
            "location": [9.14559, 45.582134]
          },
          "name": "Via Castelletto",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "krb}uAknemP??"
        }
      ],
      "distance": 29.391,
      "summary": "Via Castelletto"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.615,
      "duration": 1.538,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.14559, 45.582134]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Costantino Nigra.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.14559, 45.582134]
          },
          "name": "Via Costantino Nigra",
          "duration": 1.538,
          "distance": 6.857,
          "driving_side": "right",
          "weight": 1.615,
          "mode": "driving",
          "geometry": "krb}uAknemP@nD"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.145502, 45.582133]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.145502, 45.582133]
          },
          "name": "Via Costantino Nigra",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "irb}uA{hemP??"
        }
      ],
      "distance": 6.857,
      "summary": "Via Costantino Nigra"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 2.074,
      "duration": 1.975,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.145502, 45.582133]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Costantino Nigra.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.145502, 45.582133]
          },
          "name": "Via Costantino Nigra",
          "duration": 1.975,
          "distance": 8.805,
          "driving_side": "right",
          "weight": 2.074,
          "mode": "driving",
          "geometry": "irb}uA{hemP@`F"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.145389, 45.582132]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.145389, 45.582132]
          },
          "name": "Via Costantino Nigra",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "grb}uAyaemP??"
        }
      ],
      "distance": 8.805,
      "summary": "Via Costantino Nigra"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.954,
      "duration": 0.909,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [268],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.145389, 45.582132]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Costantino Nigra.",
            "bearing_after": 268,
            "bearing_before": 0,
            "location": [9.145389, 45.582132]
          },
          "name": "Via Costantino Nigra",
          "duration": 0.909,
          "distance": 4.05,
          "driving_side": "right",
          "weight": 0.954,
          "mode": "driving",
          "geometry": "grb}uAyaemP@fB"
        },
        {
          "intersections": [
            {
              "bearings": [88],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.145337, 45.582131]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 268,
            "location": [9.145337, 45.582131]
          },
          "name": "Via Costantino Nigra",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "erb}uAq~dmP??"
        }
      ],
      "distance": 4.05,
      "summary": "Via Costantino Nigra"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.79,
      "duration": 0.753,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [268],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.145337, 45.582131]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Costantino Nigra.",
            "bearing_after": 268,
            "bearing_before": 0,
            "location": [9.145337, 45.582131]
          },
          "name": "Via Costantino Nigra",
          "duration": 0.753,
          "distance": 3.355,
          "driving_side": "right",
          "weight": 0.79,
          "mode": "driving",
          "geometry": "erb}uAq~dmP@tA"
        },
        {
          "intersections": [
            {
              "bearings": [88],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.145294, 45.58213]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 268,
            "location": [9.145294, 45.58213]
          },
          "name": "Via Costantino Nigra",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "crb}uA{{dmP??"
        }
      ],
      "distance": 3.355,
      "summary": "Via Costantino Nigra"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 2.363,
      "duration": 2.25,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [267],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.145294, 45.58213]
            },
            {
              "bearings": [18, 87, 267],
              "entry": [true, false, true],
              "in": 1,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 1,
              "location": [9.145294, 45.58213]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Costantino Nigra.",
            "bearing_after": 267,
            "bearing_before": 0,
            "location": [9.145294, 45.58213]
          },
          "name": "Via Costantino Nigra",
          "duration": 2.25,
          "distance": 10.222,
          "driving_side": "right",
          "weight": 2.363,
          "mode": "driving",
          "geometry": "crb}uA{{dmP??HdG"
        },
        {
          "intersections": [
            {
              "bearings": [87],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.145163, 45.582125]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 267,
            "location": [9.145163, 45.582125]
          },
          "name": "Via Costantino Nigra",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "yqb}uAusdmP??"
        }
      ],
      "distance": 10.222,
      "summary": "Via Costantino Nigra"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 5.563,
      "duration": 5.175,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [271],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.145163, 45.582125]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Costantino Nigra.",
            "bearing_after": 271,
            "bearing_before": 0,
            "location": [9.145163, 45.582125]
          },
          "name": "Via Costantino Nigra",
          "duration": 5.175,
          "distance": 22.517,
          "driving_side": "right",
          "weight": 5.563,
          "mode": "driving",
          "geometry": "yqb}uAusdmPC`Q"
        },
        {
          "intersections": [
            {
              "bearings": [91],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.144874, 45.582127]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 271,
            "location": [9.144874, 45.582127]
          },
          "name": "Via Costantino Nigra",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "}qb}uAsadmP??"
        }
      ],
      "distance": 22.517,
      "summary": "Via Costantino Nigra"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.968,
      "duration": 0.9,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.144874, 45.582127]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.144874, 45.582127]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.9,
          "distance": 3.973,
          "driving_side": "right",
          "weight": 0.968,
          "mode": "driving",
          "geometry": "}qb}uAsadmP?dB"
        },
        {
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.144823, 45.582127]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.144823, 45.582127]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "}qb}uAm~cmP??"
        }
      ],
      "distance": 3.973,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 6.081,
      "duration": 5.657,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.144823, 45.582127]
            },
            {
              "bearings": [89, 177, 269],
              "entry": [false, false, true],
              "in": 0,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 1,
              "location": [9.144823, 45.582127]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.144823, 45.582127]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 5.657,
          "distance": 32.805,
          "driving_side": "right",
          "weight": 6.081,
          "mode": "driving",
          "geometry": "}qb}uAm~cmP??HhY"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.144402, 45.582122]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.144402, 45.582122]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "sqb}uAcdcmP??"
        }
      ],
      "distance": 32.805,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 8.245,
      "duration": 7.67,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [268],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.144402, 45.582122]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 268,
            "bearing_before": 0,
            "location": [9.144402, 45.582122]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 7.67,
          "distance": 48.969,
          "driving_side": "right",
          "weight": 8.245,
          "mode": "driving",
          "geometry": "sqb}uAcdcmPb@ff@"
        },
        {
          "intersections": [
            {
              "bearings": [88],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.143774, 45.582104]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 268,
            "location": [9.143774, 45.582104]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "opb}uA{|amP??"
        }
      ],
      "distance": 48.969,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 2.187,
      "duration": 2.035,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.143774, 45.582104]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.143774, 45.582104]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 2.035,
          "distance": 13.403,
          "driving_side": "right",
          "weight": 2.187,
          "mode": "driving",
          "geometry": "opb}uA{|amPBvI"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.143602, 45.582102]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.143602, 45.582102]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "kpb}uAcramP??"
        }
      ],
      "distance": 13.403,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 6.773,
      "duration": 6.3,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [268],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.143602, 45.582102]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 268,
            "bearing_before": 0,
            "location": [9.143602, 45.582102]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 6.3,
          "distance": 55.965,
          "driving_side": "right",
          "weight": 6.773,
          "mode": "driving",
          "geometry": "kpb}uAcramP\\zk@"
        },
        {
          "intersections": [
            {
              "bearings": [88],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.142884, 45.582087]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 268,
            "location": [9.142884, 45.582087]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "mob}uAge`mP??"
        }
      ],
      "distance": 55.965,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 12.61,
      "duration": 10.8,
      "steps": [
        {
          "intersections": [
            {
              "entry": [true],
              "bearings": [268],
              "duration": 8.441,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 9.074,
              "geometry_index": 0,
              "location": [9.142884, 45.582087]
            },
            {
              "bearings": [88, 268],
              "entry": [false, true],
              "in": 0,
              "turn_weight": 1,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.142007, 45.582062]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 268,
            "bearing_before": 0,
            "location": [9.142884, 45.582087]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 10.8,
          "distance": 87.878,
          "driving_side": "right",
          "weight": 12.61,
          "mode": "driving",
          "geometry": "mob}uAge`mPp@xu@LrN"
        },
        {
          "intersections": [
            {
              "bearings": [88],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.141757, 45.582055]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 268,
            "location": [9.141757, 45.582055]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "mmb}uAy~}lP??"
        }
      ],
      "distance": 87.878,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.299,
      "duration": 1.208,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [266],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.141757, 45.582055]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 266,
            "bearing_before": 0,
            "location": [9.141757, 45.582055]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 1.208,
          "distance": 9.529,
          "driving_side": "right",
          "weight": 1.299,
          "mode": "driving",
          "geometry": "mmb}uAy~}lPJrF"
        },
        {
          "intersections": [
            {
              "bearings": [86],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.141635, 45.582049]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 266,
            "location": [9.141635, 45.582049]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "amb}uAew}lP??"
        }
      ],
      "distance": 9.529,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.37,
      "duration": 1.274,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.141635, 45.582049]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.141635, 45.582049]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 1.274,
          "distance": 10.051,
          "driving_side": "right",
          "weight": 1.37,
          "mode": "driving",
          "geometry": "amb}uAew}lP?`G"
        },
        {
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.141506, 45.582049]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.141506, 45.582049]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "amb}uAco}lP??"
        }
      ],
      "distance": 10.051,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.142,
      "duration": 1.062,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [274],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.141506, 45.582049]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 274,
            "bearing_before": 0,
            "location": [9.141506, 45.582049]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 1.062,
          "distance": 8.752,
          "driving_side": "right",
          "weight": 1.142,
          "mode": "driving",
          "geometry": "amb}uAco}lPK~E"
        },
        {
          "intersections": [
            {
              "bearings": [94],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.141394, 45.582055]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 274,
            "location": [9.141394, 45.582055]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "mmb}uAch}lP??"
        }
      ],
      "distance": 8.752,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 12.835,
      "duration": 10.451,
      "steps": [
        {
          "intersections": [
            {
              "entry": [true],
              "bearings": [274],
              "duration": 3.498,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 3.76,
              "geometry_index": 0,
              "location": [9.141394, 45.582055]
            },
            {
              "bearings": [94, 274],
              "entry": [false, true],
              "in": 0,
              "turn_weight": 1.6,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.141025, 45.582073]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 274,
            "bearing_before": 0,
            "location": [9.141394, 45.582055]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 10.451,
          "distance": 86.846,
          "driving_side": "right",
          "weight": 12.835,
          "mode": "driving",
          "geometry": "mmb}uAch}lPc@`ViAlm@"
        },
        {
          "intersections": [
            {
              "bearings": [94],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.140282, 45.58211]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 274,
            "location": [9.140282, 45.58211]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "{pb}uAsb{lP??"
        }
      ],
      "distance": 86.846,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 20.628,
      "duration": 17.701,
      "steps": [
        {
          "intersections": [
            {
              "entry": [true],
              "bearings": [274],
              "duration": 1.807,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "weight": 1.942,
              "geometry_index": 0,
              "location": [9.140282, 45.58211]
            },
            {
              "bearings": [94, 274],
              "entry": [false, true],
              "in": 0,
              "turn_weight": 1.6,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.140089, 45.582119]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 274,
            "bearing_before": 0,
            "location": [9.140282, 45.58211]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 17.701,
          "distance": 147.468,
          "driving_side": "right",
          "weight": 20.628,
          "mode": "driving",
          "geometry": "{pb}uAsb{lPQ`KgD|hB"
        },
        {
          "intersections": [
            {
              "bearings": [94],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.138394, 45.582203]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 274,
            "location": [9.138394, 45.582203]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "uvb}uAslwlP??"
        }
      ],
      "distance": 147.468,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.361,
      "duration": 1.266,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [274],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.138394, 45.582203]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 274,
            "bearing_before": 0,
            "location": [9.138394, 45.582203]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 1.266,
          "distance": 10.547,
          "driving_side": "right",
          "weight": 1.361,
          "mode": "driving",
          "geometry": "uvb}uAslwlPMlG"
        },
        {
          "intersections": [
            {
              "bearings": [94],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.138259, 45.58221]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 274,
            "location": [9.138259, 45.58221]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "cwb}uAedwlP??"
        }
      ],
      "distance": 10.547,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.087,
      "duration": 1.011,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [268],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.138259, 45.58221]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 268,
            "bearing_before": 0,
            "location": [9.138259, 45.58221]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 1.011,
          "distance": 7.95,
          "driving_side": "right",
          "weight": 1.087,
          "mode": "driving",
          "geometry": "cwb}uAedwlPBjE"
        },
        {
          "intersections": [
            {
              "bearings": [88],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.138157, 45.582208]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 268,
            "location": [9.138157, 45.582208]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "_wb}uAy}vlP??"
        }
      ],
      "distance": 7.95,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 4.442,
      "duration": 4.132,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.138157, 45.582208]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.138157, 45.582208]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 4.132,
          "distance": 32.492,
          "driving_side": "right",
          "weight": 4.442,
          "mode": "driving",
          "geometry": "_wb}uAy}vlPF`Y"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.13774, 45.582204]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.13774, 45.582204]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "wvb}uAwcvlP??"
        }
      ],
      "distance": 32.492,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 3.778,
      "duration": 3.514,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [271],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.13774, 45.582204]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 271,
            "bearing_before": 0,
            "location": [9.13774, 45.582204]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 3.514,
          "distance": 40.828,
          "driving_side": "right",
          "weight": 3.778,
          "mode": "driving",
          "geometry": "wvb}uAwcvlPGv_@"
        },
        {
          "intersections": [
            {
              "bearings": [91],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.137216, 45.582208]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 271,
            "location": [9.137216, 45.582208]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "_wb}uA_culP??"
        }
      ],
      "distance": 40.828,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.198,
      "duration": 1.114,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [271],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": true,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.137216, 45.582208]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 271,
            "bearing_before": 0,
            "location": [9.137216, 45.582208]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 1.114,
          "distance": 13.093,
          "driving_side": "right",
          "weight": 1.198,
          "mode": "driving",
          "geometry": "_wb}uA_culPEnI"
        },
        {
          "intersections": [
            {
              "bearings": [91],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.137048, 45.582211]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 271,
            "location": [9.137048, 45.582211]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "ewb}uAoxtlP??"
        }
      ],
      "distance": 13.093,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 3.137,
      "duration": 2.987,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [272],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.137048, 45.582211]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 272,
            "bearing_before": 0,
            "location": [9.137048, 45.582211]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 2.987,
          "distance": 39.283,
          "driving_side": "right",
          "weight": 3.137,
          "mode": "driving",
          "geometry": "ewb}uAoxtlPSn^"
        },
        {
          "intersections": [
            {
              "bearings": [92],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.136544, 45.582221]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 272,
            "location": [9.136544, 45.582221]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "ywb}uA_yslP??"
        }
      ],
      "distance": 39.283,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 3.253,
      "duration": 3.098,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [272],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.136544, 45.582221]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 272,
            "bearing_before": 0,
            "location": [9.136544, 45.582221]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 3.098,
          "distance": 37.492,
          "driving_side": "right",
          "weight": 3.253,
          "mode": "driving",
          "geometry": "ywb}uA_yslPS`]"
        },
        {
          "intersections": [
            {
              "bearings": [92],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.136063, 45.582231]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 272,
            "location": [9.136063, 45.582231]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "mxb}uA}zrlP??"
        }
      ],
      "distance": 37.492,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.345,
      "duration": 1.281,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [271],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.136063, 45.582231]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 271,
            "bearing_before": 0,
            "location": [9.136063, 45.582231]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 1.281,
          "distance": 16.597,
          "driving_side": "right",
          "weight": 1.345,
          "mode": "driving",
          "geometry": "mxb}uA}zrlPChL"
        },
        {
          "intersections": [
            {
              "bearings": [91],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.13585, 45.582233]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 271,
            "location": [9.13585, 45.582233]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "qxb}uAsmrlP??"
        }
      ],
      "distance": 16.597,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 2.837,
      "duration": 2.702,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [272],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.13585, 45.582233]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 272,
            "bearing_before": 0,
            "location": [9.13585, 45.582233]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 2.702,
          "distance": 35.004,
          "driving_side": "right",
          "weight": 2.837,
          "mode": "driving",
          "geometry": "qxb}uAsmrlPU`["
        },
        {
          "intersections": [
            {
              "bearings": [92],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.135401, 45.582244]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 272,
            "location": [9.135401, 45.582244]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "gyb}uAqqqlP??"
        }
      ],
      "distance": 35.004,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 7.399,
      "duration": 7.047,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [272],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.135401, 45.582244]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 272,
            "bearing_before": 0,
            "location": [9.135401, 45.582244]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 7.047,
          "distance": 92.123,
          "driving_side": "right",
          "weight": 7.399,
          "mode": "driving",
          "geometry": "gyb}uAqqqlPk@zhA"
        },
        {
          "intersections": [
            {
              "bearings": [92],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.134219, 45.582266]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 272,
            "location": [9.134219, 45.582266]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "szb}uAugolP??"
        }
      ],
      "distance": 92.123,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 3.392,
      "duration": 3.231,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.134219, 45.582266]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.134219, 45.582266]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 3.231,
          "distance": 35.294,
          "driving_side": "right",
          "weight": 3.392,
          "mode": "driving",
          "geometry": "szb}uAugolPAh["
        },
        {
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.133766, 45.582267]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.133766, 45.582267]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "uzb}uAkknlP??"
        }
      ],
      "distance": 35.294,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.366,
      "duration": 1.301,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [281],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.133766, 45.582267]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 281,
            "bearing_before": 0,
            "location": [9.133766, 45.582267]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 1.301,
          "distance": 9.531,
          "driving_side": "right",
          "weight": 1.366,
          "mode": "driving",
          "geometry": "uzb}uAkknlPY`DElA"
        },
        {
          "intersections": [
            {
              "bearings": [101],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.133646, 45.582283]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 281,
            "location": [9.133646, 45.582283]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "u{b}uA{cnlP??"
        }
      ],
      "distance": 9.531,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.47,
      "duration": 0.448,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [274],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.133646, 45.582283]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 274,
            "bearing_before": 0,
            "location": [9.133646, 45.582283]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.448,
          "distance": 3.28,
          "driving_side": "right",
          "weight": 0.47,
          "mode": "driving",
          "geometry": "u{b}uA{cnlPCrA"
        },
        {
          "intersections": [
            {
              "bearings": [94],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.133604, 45.582285]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 274,
            "location": [9.133604, 45.582285]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "y{b}uAganlP??"
        }
      ],
      "distance": 3.28,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.755,
      "duration": 1.672,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [264],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.133604, 45.582285]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 264,
            "bearing_before": 0,
            "location": [9.133604, 45.582285]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 1.672,
          "distance": 12.246,
          "driving_side": "right",
          "weight": 1.755,
          "mode": "driving",
          "geometry": "y{b}uAganlPVvH"
        },
        {
          "intersections": [
            {
              "bearings": [84],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.133448, 45.582273]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 264,
            "location": [9.133448, 45.582273]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "a{b}uAowmlP??"
        }
      ],
      "distance": 12.246,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.915,
      "duration": 0.872,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [283],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.133448, 45.582273]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 283,
            "bearing_before": 0,
            "location": [9.133448, 45.582273]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.872,
          "distance": 6.387,
          "driving_side": "right",
          "weight": 0.915,
          "mode": "driving",
          "geometry": "a{b}uAowmlPG`AQ|A"
        },
        {
          "intersections": [
            {
              "bearings": [103],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.133368, 45.582286]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 283,
            "location": [9.133368, 45.582286]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "{{b}uAormlP??"
        }
      ],
      "distance": 6.387,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.549,
      "duration": 0.523,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [297],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.133368, 45.582286]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction":
                "Drive northwest on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 297,
            "bearing_before": 0,
            "location": [9.133368, 45.582286]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "{{b}uAormlP??"
        },
        {
          "intersections": [
            {
              "bearings": [117, 163, 297],
              "entry": [false, false, true],
              "in": 0,
              "mapbox_streets_v8": {"class": "roundabout"},
              "is_urban": false,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 1,
              "location": [9.133368, 45.582286]
            }
          ],
          "maneuver": {
            "type": "roundabout",
            "exit": 1,
            "instruction": "Enter the roundabout and take the 1st exit.",
            "modifier": "straight",
            "bearing_after": 297,
            "bearing_before": 297,
            "location": [9.133368, 45.582286]
          },
          "name": "",
          "duration": 0.523,
          "distance": 3.863,
          "driving_side": "right",
          "weight": 0.549,
          "mode": "driving",
          "geometry": "{{b}uAormlP_@vA"
        },
        {
          "intersections": [
            {
              "bearings": [117],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.133324, 45.582302]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 297,
            "location": [9.133324, 45.582302]
          },
          "name": "",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "{|b}uAwomlP??"
        }
      ],
      "distance": 3.863,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.546,
      "duration": 0.52,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [277],
              "entry": [true],
              "mapbox_streets_v8": {"class": "roundabout"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.133324, 45.582302]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west.",
            "bearing_after": 277,
            "bearing_before": 0,
            "location": [9.133324, 45.582302]
          },
          "name": "",
          "duration": 0.52,
          "distance": 3.844,
          "driving_side": "right",
          "weight": 0.546,
          "mode": "driving",
          "geometry": "{|b}uAwomlPG`B"
        },
        {
          "intersections": [
            {
              "bearings": [97],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.133275, 45.582306]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 277,
            "location": [9.133275, 45.582306]
          },
          "name": "",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "c}b}uAulmlP??"
        }
      ],
      "distance": 3.844,
      "summary": ""
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.54,
      "duration": 0.514,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [260],
              "entry": [true],
              "mapbox_streets_v8": {"class": "roundabout"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.133275, 45.582306]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west.",
            "bearing_after": 260,
            "bearing_before": 0,
            "location": [9.133275, 45.582306]
          },
          "name": "",
          "duration": 0.514,
          "distance": 3.799,
          "driving_side": "right",
          "weight": 0.54,
          "mode": "driving",
          "geometry": "c}b}uAulmlPJ~A"
        },
        {
          "intersections": [
            {
              "bearings": [80],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.133227, 45.5823]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 260,
            "location": [9.133227, 45.5823]
          },
          "name": "",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "w|b}uAuimlP??"
        }
      ],
      "distance": 3.799,
      "summary": ""
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.547,
      "duration": 0.521,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [241],
              "entry": [true],
              "mapbox_streets_v8": {"class": "roundabout"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.133227, 45.5823]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive southwest.",
            "bearing_after": 241,
            "bearing_before": 0,
            "location": [9.133227, 45.5823]
          },
          "name": "",
          "duration": 0.521,
          "distance": 3.848,
          "driving_side": "right",
          "weight": 0.547,
          "mode": "driving",
          "geometry": "w|b}uAuimlP`@tA"
        },
        {
          "intersections": [
            {
              "bearings": [61],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.133184, 45.582283]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 241,
            "location": [9.133184, 45.582283]
          },
          "name": "",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "u{b}uA_gmlP??"
        }
      ],
      "distance": 3.848,
      "summary": ""
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.606,
      "duration": 0.578,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [259],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.133184, 45.582283]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 259,
            "bearing_before": 0,
            "location": [9.133184, 45.582283]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.578,
          "distance": 5.392,
          "driving_side": "right",
          "weight": 0.606,
          "mode": "driving",
          "geometry": "u{b}uA_gmlPPfC"
        },
        {
          "intersections": [
            {
              "bearings": [79],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.133116, 45.582274]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 259,
            "location": [9.133116, 45.582274]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "c{b}uAwbmlP??"
        }
      ],
      "distance": 5.392,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.684,
      "duration": 1.604,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [268],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.133116, 45.582274]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 268,
            "bearing_before": 0,
            "location": [9.133116, 45.582274]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 1.604,
          "distance": 14.977,
          "driving_side": "right",
          "weight": 1.684,
          "mode": "driving",
          "geometry": "c{b}uAwbmlPHjFArC"
        },
        {
          "intersections": [
            {
              "bearings": [88],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.132924, 45.58227]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 268,
            "location": [9.132924, 45.58227]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "{zb}uAwvllP??"
        }
      ],
      "distance": 14.977,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.907,
      "duration": 0.864,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [272],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.132924, 45.58227]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 272,
            "bearing_before": 0,
            "location": [9.132924, 45.58227]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.864,
          "distance": 6.159,
          "driving_side": "right",
          "weight": 0.907,
          "mode": "driving",
          "geometry": "{zb}uAwvllPC|C"
        },
        {
          "intersections": [
            {
              "bearings": [92],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.132845, 45.582272]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 272,
            "location": [9.132845, 45.582272]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "_{b}uAyqllP??"
        }
      ],
      "distance": 6.159,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.976,
      "duration": 1.882,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.132845, 45.582272]
            },
            {
              "bearings": [1, 90, 270],
              "entry": [true, false, true],
              "in": 1,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 1,
              "location": [9.132845, 45.582272]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.132845, 45.582272]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 1.882,
          "distance": 22.672,
          "driving_side": "right",
          "weight": 1.976,
          "mode": "driving",
          "geometry": "_{b}uAyqllP???dQ"
        },
        {
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.132554, 45.582272]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.132554, 45.582272]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "_{b}uAs_llP??"
        }
      ],
      "distance": 22.672,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 4.811,
      "duration": 4.582,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.132554, 45.582272]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.132554, 45.582272]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 4.582,
          "distance": 55.629,
          "driving_side": "right",
          "weight": 4.811,
          "mode": "driving",
          "geometry": "_{b}uAs_llP@rk@"
        },
        {
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.13184, 45.582271]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.13184, 45.582271]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "}zb}uA_sjlP??"
        }
      ],
      "distance": 55.629,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.344,
      "duration": 0.327,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [268],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.13184, 45.582271]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 268,
            "bearing_before": 0,
            "location": [9.13184, 45.582271]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.327,
          "distance": 3.819,
          "driving_side": "right",
          "weight": 0.344,
          "mode": "driving",
          "geometry": "}zb}uA_sjlP@`B"
        },
        {
          "intersections": [
            {
              "bearings": [88],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.131791, 45.58227]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 268,
            "location": [9.131791, 45.58227]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "{zb}uA}ojlP??"
        }
      ],
      "distance": 3.819,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.515,
      "duration": 0.491,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.131791, 45.58227]
            },
            {
              "bearings": [89, 182, 269],
              "entry": [false, false, true],
              "in": 0,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 1,
              "location": [9.131791, 45.58227]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.131791, 45.58227]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.491,
          "distance": 6.468,
          "driving_side": "right",
          "weight": 0.515,
          "mode": "driving",
          "geometry": "{zb}uA}ojlP??@dD"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.131708, 45.582269]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.131708, 45.582269]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "yzb}uAwjjlP??"
        }
      ],
      "distance": 6.468,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 4.522,
      "duration": 3.355,
      "steps": [
        {
          "intersections": [
            {
              "entry": [true],
              "bearings": [270],
              "duration": 2.618,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "weight": 2.749,
              "geometry_index": 0,
              "location": [9.131708, 45.582269]
            },
            {
              "bearings": [90, 270],
              "entry": [false, true],
              "in": 0,
              "turn_weight": 1,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.1313, 45.582269]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.131708, 45.582269]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 3.355,
          "distance": 40.436,
          "driving_side": "right",
          "weight": 4.522,
          "mode": "driving",
          "geometry": "yzb}uAwjjlP?nX?|E"
        },
        {
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.131189, 45.582269]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.131189, 45.582269]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "yzb}uAijilP??"
        }
      ],
      "distance": 40.436,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.859,
      "duration": 0.818,
      "steps": [
        {
          "intersections": [
            {
              "entry": [true],
              "bearings": [270],
              "duration": 0.164,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "weight": 0.172,
              "geometry_index": 0,
              "location": [9.131189, 45.582269]
            },
            {
              "bearings": [90, 270],
              "entry": [false, true],
              "in": 0,
              "turn_weight": 1,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.131165, 45.582269]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.131189, 45.582269]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.818,
          "distance": 9.427,
          "driving_side": "right",
          "weight": 1.859,
          "mode": "driving",
          "geometry": "yzb}uAijilP?n@?`E"
        },
        {
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.131068, 45.582269]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.131068, 45.582269]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "yzb}uAwbilP??"
        }
      ],
      "distance": 9.427,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.643,
      "duration": 0.613,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.131068, 45.582269]
            },
            {
              "bearings": [0, 90, 270],
              "entry": [true, false, true],
              "in": 1,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 1,
              "location": [9.131068, 45.582269]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.131068, 45.582269]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.613,
          "distance": 7.713,
          "driving_side": "right",
          "weight": 0.643,
          "mode": "driving",
          "geometry": "yzb}uAwbilP???dE"
        },
        {
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.130969, 45.582269]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.130969, 45.582269]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "yzb}uAq|hlP??"
        }
      ],
      "distance": 7.713,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 3.129,
      "duration": 2.027,
      "steps": [
        {
          "intersections": [
            {
              "entry": [true],
              "bearings": [271],
              "duration": 1.627,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "weight": 1.709,
              "geometry_index": 0,
              "location": [9.130969, 45.582269]
            },
            {
              "bearings": [91, 270],
              "entry": [false, true],
              "in": 0,
              "turn_weight": 1,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.130706, 45.582271]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 271,
            "bearing_before": 0,
            "location": [9.130969, 45.582269]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 2.027,
          "distance": 25.712,
          "driving_side": "right",
          "weight": 3.129,
          "mode": "driving",
          "geometry": "yzb}uAq|hlPClO?dC"
        },
        {
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.130639, 45.582271]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.130639, 45.582271]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "}zb}uA}ghlP??"
        }
      ],
      "distance": 25.712,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 5.574,
      "duration": 4.357,
      "steps": [
        {
          "intersections": [
            {
              "entry": [true],
              "bearings": [270],
              "duration": 0.584,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "weight": 0.613,
              "geometry_index": 0,
              "location": [9.130639, 45.582271]
            },
            {
              "bearings": [90, 270],
              "entry": [false, true],
              "in": 0,
              "turn_weight": 1,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.13056, 45.582271]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.130639, 45.582271]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 4.357,
          "distance": 45.034,
          "driving_side": "right",
          "weight": 5.574,
          "mode": "driving",
          "geometry": "}zb}uA}ghlP?|CDd^"
        },
        {
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.130061, 45.582268]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.130061, 45.582268]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "wzb}uAycglP??"
        }
      ],
      "distance": 45.034,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 4.62,
      "duration": 4.4,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.130061, 45.582268]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.130061, 45.582268]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 4.4,
          "distance": 45.344,
          "driving_side": "right",
          "weight": 4.62,
          "mode": "driving",
          "geometry": "wzb}uAycglPAjc@"
        },
        {
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.129479, 45.582269]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.129479, 45.582269]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "yzb}uAm_flP??"
        }
      ],
      "distance": 45.344,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 4.52,
      "duration": 2.4,
      "steps": [
        {
          "intersections": [
            {
              "entry": [true],
              "bearings": [270],
              "duration": 1.114,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "weight": 1.17,
              "geometry_index": 0,
              "location": [9.129479, 45.582269]
            },
            {
              "entry": [false, true],
              "in": 0,
              "bearings": [90, 269],
              "duration": 0.429,
              "turn_weight": 1,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 1,
              "weight": 1.45,
              "geometry_index": 1,
              "location": [9.129312, 45.582268]
            },
            {
              "bearings": [89, 269],
              "entry": [false, true],
              "in": 0,
              "turn_weight": 1,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 2,
              "location": [9.129243, 45.582267]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.129479, 45.582269]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 2.4,
          "distance": 28.518,
          "driving_side": "right",
          "weight": 4.52,
          "mode": "driving",
          "geometry": "yzb}uAm_flP@lI@hC@bG"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 3,
              "location": [9.129113, 45.582266]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.129113, 45.582266]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "szb}uAqhelP??"
        }
      ],
      "distance": 28.518,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.724,
      "duration": 0.689,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.129113, 45.582266]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.129113, 45.582266]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.689,
          "distance": 9.271,
          "driving_side": "right",
          "weight": 0.724,
          "mode": "driving",
          "geometry": "szb}uAqhelP?lF"
        },
        {
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.128994, 45.582266]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.128994, 45.582266]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "szb}uAcaelP??"
        }
      ],
      "distance": 9.271,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.724,
      "duration": 0.689,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.128994, 45.582266]
            },
            {
              "bearings": [89, 179, 269],
              "entry": [false, false, true],
              "in": 0,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 1,
              "location": [9.128994, 45.582266]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.128994, 45.582266]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.689,
          "distance": 8.649,
          "driving_side": "right",
          "weight": 0.724,
          "mode": "driving",
          "geometry": "szb}uAcaelP??@|E"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.128883, 45.582265]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.128883, 45.582265]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "qzb}uAezdlP??"
        }
      ],
      "distance": 8.649,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 6.681,
      "duration": 6.363,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.128883, 45.582265]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.128883, 45.582265]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 6.363,
          "distance": 76.357,
          "driving_side": "right",
          "weight": 6.681,
          "mode": "driving",
          "geometry": "qzb}uAezdlPLf|@"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.127903, 45.582258]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.127903, 45.582258]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "czb}uA}|blP??"
        }
      ],
      "distance": 76.357,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.891,
      "duration": 0.848,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.127903, 45.582258]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.127903, 45.582258]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.848,
          "distance": 7.792,
          "driving_side": "right",
          "weight": 0.891,
          "mode": "driving",
          "geometry": "czb}uA}|blP@fE"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.127803, 45.582257]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.127803, 45.582257]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "azb}uAuvblP??"
        }
      ],
      "distance": 7.792,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 5.524,
      "duration": 5.261,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.127803, 45.582257]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.127803, 45.582257]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 5.261,
          "distance": 48.309,
          "driving_side": "right",
          "weight": 5.524,
          "mode": "driving",
          "geometry": "azb}uAuvblPJve@"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.127183, 45.582251]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.127183, 45.582251]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "uyb}uA}oalP??"
        }
      ],
      "distance": 48.309,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 1.078,
      "duration": 1.027,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.127183, 45.582251]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.127183, 45.582251]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 1.027,
          "distance": 4.364,
          "driving_side": "right",
          "weight": 1.078,
          "mode": "driving",
          "geometry": "uyb}uA}oalP@nB"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.127127, 45.58225]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.127127, 45.58225]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "syb}uAmlalP??"
        }
      ],
      "distance": 4.364,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 4.718,
      "duration": 4.493,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.127127, 45.58225]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.127127, 45.58225]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 4.493,
          "distance": 19.091,
          "driving_side": "right",
          "weight": 4.718,
          "mode": "driving",
          "geometry": "syb}uAmlalPDhN"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.126882, 45.582247]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.126882, 45.582247]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "myb}uAc}`lP??"
        }
      ],
      "distance": 19.091,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 5.221,
      "duration": 4.972,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.126882, 45.582247]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.126882, 45.582247]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 4.972,
          "distance": 20.883,
          "driving_side": "right",
          "weight": 5.221,
          "mode": "driving",
          "geometry": "myb}uAc}`lPDvO"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.126614, 45.582244]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.126614, 45.582244]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "gyb}uAkl`lP??"
        }
      ],
      "distance": 20.883,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 2.591,
      "duration": 2.468,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.126614, 45.582244]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.126614, 45.582244]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 2.468,
          "distance": 10.365,
          "driving_side": "right",
          "weight": 2.591,
          "mode": "driving",
          "geometry": "gyb}uAkl`lPBhG"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.126481, 45.582242]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.126481, 45.582242]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "cyb}uAad`lP??"
        }
      ],
      "distance": 10.365,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 14.468,
      "duration": 14.115,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.126481, 45.582242]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.126481, 45.582242]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 14.115,
          "distance": 164.333,
          "driving_side": "right",
          "weight": 14.468,
          "mode": "driving",
          "geometry": "cyb}uAad`lPj@xbC"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.124372, 45.58222]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.124372, 45.58222]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "wwb}uAg`|kP??"
        }
      ],
      "distance": 164.333,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.556,
      "duration": 0.542,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.124372, 45.58222]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.124372, 45.58222]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.542,
          "distance": 6.312,
          "driving_side": "right",
          "weight": 0.556,
          "mode": "driving",
          "geometry": "wwb}uAg`|kP@`D"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.124291, 45.582219]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.124291, 45.582219]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "uwb}uAe{{kP??"
        }
      ],
      "distance": 6.312,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 8.2,
      "duration": 8,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.124291, 45.582219]
            },
            {
              "bearings": [0, 89, 269],
              "entry": [true, false, true],
              "in": 1,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 2,
              "geometry_index": 1,
              "location": [9.124291, 45.582219]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.124291, 45.582219]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 8,
          "distance": 80.495,
          "driving_side": "right",
          "weight": 8.2,
          "mode": "driving",
          "geometry": "uwb}uAe{{kP??Xp_A"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.123258, 45.582206]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.123258, 45.582206]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "{vb}uAszykP??"
        }
      ],
      "distance": 80.495,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.492,
      "duration": 0.48,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.123258, 45.582206]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.123258, 45.582206]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.48,
          "distance": 6.078,
          "driving_side": "right",
          "weight": 0.492,
          "mode": "driving",
          "geometry": "{vb}uAszykP@zC"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.12318, 45.582205]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.12318, 45.582205]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "yvb}uAwuykP??"
        }
      ],
      "distance": 6.078,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.436,
      "duration": 0.425,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.12318, 45.582205]
            },
            {
              "bearings": [89, 269, 359],
              "entry": [false, true, false],
              "in": 0,
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 1,
              "geometry_index": 1,
              "location": [9.12318, 45.582205]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.12318, 45.582205]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.425,
          "distance": 5.377,
          "driving_side": "right",
          "weight": 0.436,
          "mode": "driving",
          "geometry": "yvb}uAwuykP??@hC"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 2,
              "location": [9.123111, 45.582204]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.123111, 45.582204]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "wvb}uAmqykP??"
        }
      ],
      "distance": 5.377,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 2.853,
      "duration": 2.784,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.123111, 45.582204]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.123111, 45.582204]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 2.784,
          "distance": 35.227,
          "driving_side": "right",
          "weight": 2.853,
          "mode": "driving",
          "geometry": "wvb}uAmqykPNf["
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.122659, 45.582196]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.122659, 45.582196]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "gvb}uAeuxkP??"
        }
      ],
      "distance": 35.227,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.882,
      "duration": 0.861,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [269],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.122659, 45.582196]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 269,
            "bearing_before": 0,
            "location": [9.122659, 45.582196]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.861,
          "distance": 11.144,
          "driving_side": "right",
          "weight": 0.882,
          "mode": "driving",
          "geometry": "gvb}uAeuxkPB|G"
        },
        {
          "intersections": [
            {
              "bearings": [89],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.122516, 45.582194]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 269,
            "location": [9.122516, 45.582194]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "cvb}uAglxkP??"
        }
      ],
      "distance": 11.144,
      "summary": "Via Camillo Benso Conte di Cavour"
    },
    {
      "via_waypoints": [],
      "admins": [
        {"iso_3166_1_alpha3": "ITA", "iso_3166_1": "IT"}
      ],
      "weight": 0.882,
      "duration": 0.861,
      "steps": [
        {
          "intersections": [
            {
              "bearings": [270],
              "entry": [true],
              "mapbox_streets_v8": {"class": "street"},
              "is_urban": false,
              "admin_index": 0,
              "out": 0,
              "geometry_index": 0,
              "location": [9.122516, 45.582194]
            }
          ],
          "maneuver": {
            "type": "depart",
            "instruction": "Drive west on Via Camillo Benso Conte di Cavour.",
            "bearing_after": 270,
            "bearing_before": 0,
            "location": [9.122516, 45.582194]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0.861,
          "distance": 10.674,
          "driving_side": "right",
          "weight": 0.882,
          "mode": "driving",
          "geometry": "cvb}uAglxkP?pG"
        },
        {
          "intersections": [
            {
              "bearings": [90],
              "entry": [true],
              "in": 0,
              "admin_index": 0,
              "geometry_index": 1,
              "location": [9.122379, 45.582194]
            }
          ],
          "maneuver": {
            "type": "arrive",
            "instruction": "You have arrived at your destination.",
            "bearing_after": 0,
            "bearing_before": 270,
            "location": [9.122379, 45.582194]
          },
          "name": "Via Camillo Benso Conte di Cavour",
          "duration": 0,
          "distance": 0,
          "driving_side": "right",
          "weight": 0,
          "mode": "driving",
          "geometry": "cvb}uAucxkP??"
        }
      ],
      "distance": 10.674,
      "summary": "Via Camillo Benso Conte di Cavour"
    }
  ],
  "geometry":
      "ms_}uAcwnmPdw@}Tj_@uIa@bNaAfUKhHHvAPlCvD~]|CxWn@bGdFpc@`Gtg@vG|l@hAhJv@fI~@dIdBlN~@xC??X|B{@`DuB`Ekb@tGof@rH}C^aBTcMnAgJJ{BBahAGmH_@mKCoOI@nD@`F@fB@tAHdGC`Q?dBHhYb@ff@BvI\\zk@~@leAJrF?`GK~EmBndAyD~tBMlGBjEF`YGv_@EnISn^S`]ChLU`[k@zhAAh[_@nFCrAVvHY~C??_@vAG`BJ~A`@tAPfCF~JC|C?dQ@rk@@`B@dD?l_@?pF?dECrSDbc@Ajc@DzU?lF@|ELf|@@fEJve@@nBDhNDvOBhGj@xbC@`DXp_A@zC@hCNf[B|G?pG"
};
