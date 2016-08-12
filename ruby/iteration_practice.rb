bicycle_types = {
  mountain_bike: {
    twenty_four: {
      name_convention: 'child bike',
      wheel_convention: 'small-wheels',
      frame_material: [
        "aluminum",
        steel: {
          manufacturer: 'industry standards',
          custom: 'client standards',
          boutique: 'craftsman standards'
        }
      ],
      gear_options: [
        "single-speed",
        24,
        27,
        30,
        20
      ],
      applications: [
        "cross-country",
        "cruising"
      ]
    },
    twenty_six: {
      name_convention: 'standard bike',
      wheel_convention: 'standard wheels',
      frame_material: [
        "steel",
        "carbon",
        "aluminum",
        titanium: {
          manufacturer: 'industry standards',
          custom: 'client standards',
          boutique: 'craftsman standards'
        }
      ],
      gear_options: [
        "single-speed",
        24,
        27,
        "11 X 1",
        30,
        22,
        20,
        33
      ],
      applications: [
        "downhill",
        "cross-country",
        "cruising",
        "free-ride"
      ]
    },
    twenty_niner: {
      name_convention: 'Twenty Niner',
      wheel_convention: 'Big Wheels',
      frame_material: {
        steel: {
          manufacturer: 'industry standards',
          custom: 'client standards',
          boutique: 'craftsman standards'
        },
        carbon: 'not often custom',
        aluminum: 'not often custom',
        titanium: {
          manufacturer: 'industry standards',
          custom: 'client standards',
          boutique: 'craftsman standards'
        },
        scandium: 'not often custom'
      },
      gear_options: [
        "single-speed",
        24,
        27,
        "11 X 1",
        30,
        22,
        20,
        33
      ],
      applications: [
        "downhill",
        "cross-country",
        "enduro",
        "free-ride"
      ]
    }
  },
  road_bike: {
    name_convention: 'roadie',
    wheel_convention: '700-c',
    frame_material: [
        "steel",
        "carbon",
        "aluminum",
        "titanium",
        "scandium",
        "bamboo"
    ],
    gear_options: [
      "single-speed",
      24,
      27,
      30,
      22,
      20,
      33
    ],
    applications: [
      "randonneuring",
      "gravel-grinder",
      "centuries",
      "epics",
      "bike path cruising",
      "climbing",
      "cobbles",
      "endurance"
    ]
  },
  others: [
    "bmx",
    "cyclo-cross",
    "fat-bikes",
    "uni-cycle",
    "Franken-bike",
    "36-er",
    "striders",
    "tri-cycle",
    "recumbent",
    "cruiser"]
}

