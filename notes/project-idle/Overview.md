Plans for Project Idle (working name because I'm shit at naming things)

## Gameplay

Earth is dying and a new place for humanity to live is desperately needed. A proof-of-concept lunar base needs to be established to determine if moving people to a different solar body is even possible. You are in charge of setting up a colony on the lunar surface to provide resources, power, and a place for scientists and engineers to live.

You're being placed in near the south pole of Luna in an area with year round sunlight. A nearby crater in a state of permanent darkness contains an ice field that can be used to provide water and oxygen to the colony. You, a chemist, and an engineer are the first people to land. You have a small base with a state-of-the-art fabricator, a small RTG, and the capability to electrolyze the ice water to produce oxygen.

## Mechanics

### Time

In-game days are tied to Earth time, meaning 24 hours per day. Each in-game day will take 6 minutes, with buildings producing at different rates. Each hour (15 seconds), each building will produce a set amount of their resource.

### Power

For any buildings, manufacturing systems, and oxygen producers to function, you need a stable power source.

#### Base

The starting base has an RTG that can provide a small amount of power to begin production.

| RTG     | Power  |
| ------- | ------ |
| MK I    | 25U/Hr |

#### Solar

Solar energy will be the primary power source, and since the colony will be near the south pole, sunlight is constantly available.

| Panel   | Power   |
| ------- | ------- |
| MK I    | 10U/Hr  |
| MK II   | 25U/Hr  |
| MK III  | 50U/Hr  |
| MK IV   | 100U/Hr |
| MK V    | 250U/Hr |


#### Batteries

Battery backups can be used to supply power to the colony when other methods are insufficient. The base contains one MK I battery.

| Battery | Capacity  |
| ------- | --------- |
| MK I    | 100U      |
| MK II   | 250U      |
| MK III  | 500U      |
| MK IV   | 1000U     |
| MK V    | 2500U     |

### Material Gathering and Processing

Materials are acquired through different means. The starting base comes with two drills: one can be used for mining regolith while the other should be used to mine ice. It also comes with a processor that can extract resources from the regolith, an ice melter, and an electrolyzer . All listed numbers are base values prior to any upgrades.

#### Drills

Drills can mine the lunar regolith or ice from the ice field.

| Drill    | Output    | Energy Draw |
| -------- | --------- | ----------- |
| MK I     | 50Kg/Hr   | 1U/Hr       |
| MK II    | 100Kg/Hr  | 2U/Hr       |
| MK III   | 250Kg/Hr  | 4U/Hr       |
| MK IV    | 500Kg/Hr  | 6U/Hr       |
| MK V     | 1000Kg/Hr | 10U/Hr      |

#### Processors

Processors can turn regolith into raw materials.

| Processor | Input    | Energy Draw | Efficiency |
| --------- | -------- | ----------- | ---------- |
| MK I      | 25Kg/Hr  | 2U/Hr       | 10 %       |
| MK II     | 50Kg/Hr  | 4U/Hr       | 20 %       |
| MK III    | 125Kg/Hr | 8U/Hr       | 35 %       |
| MK IV     | 250Kg/Hr | 12U/Hr      | 50 %       |
| MK V      | 500Kg/Hr | 20U/Hr      | 65 %       |

#### Ice Melters

Ice melters can melt large quantities of ice to produce clean drinking water.

A person needs (averaged) about 0.125 liters of water an hour.

| Melter | Input     | Output   | Energy Draw |
| ------ | --------- | -------- | ----------- |
| MK I   | 50Kg/Hr   | 50L/Hr   | 4U/Hr       |
| MK II  | 100Kg/Hr  | 100L/Hr  | 8U/Hr       |
| MK III | 250Kg/Hr  | 250L/Hr  | 14U/Hr      |
| MK IV  | 500Kg/Hr  | 500L/Hr  | 20U/Hr      |
| MK V   | 1000Kg/Hr | 1000L/Hr | 30U/Hr      |

#### Electrolyzers

Electrolyzers convert water into hydrogen and oxygen. The game currently has no use for hydrogen, so it will be harmlessly vented into the atmosphere. The base has a MK I electrolyzer for oxygen production.

1 real life person needs about 15 liters of oxygen per hour. With no upgrades, this means about 90 liters of water per hour must be processed per person. However, that would mean needing at least 270Kg of ice per hour right at the start of the game. That's absurd, and this is a game that's not meant to be realistic, so fuck it: a person *in this game* needs only 5L of oxygen per hour.

| Electrolyzer | Input    | Output   | Energy Draw |
| ------------ | -------- | -------- | ----------- |
| MK I         | 120L/Hr  | 20L/Hr   | 5U/Hr       |
| MK II        | 360L/Hr  | 60L/Hr   | 8U/Hr       |
| MK III       | 1080L/Hr | 180L/Hr  | 15U/Hr      |
| MK IV        | 3240L/Hr | 540L/Hr  | 25U/Hr      |
| MK V         | 9720L/Hr | 1620L/Hr | 60U/Hr      |

## Starting Base

The starting base will have the following already deployed and operational:

* 1x MK I RTG
* 4x MK I Miner
* 1x MK I Processor
* 3x MK 1 Ice Melter
* 1x MK I Electrolyzer

The combined power draw of all machines is 23U/hr, which is 2 units under the RTG's output.