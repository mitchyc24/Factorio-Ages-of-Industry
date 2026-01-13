Factorio: Ages of Industry

High-Level Design Document & Mod Overview

1. Concept Overview

Ages of Industry is a total overhaul mod for Factorio that bridges the gap between civilization building and industrial automation. Unlike vanilla Factorio, where the factory runs solely on electricity and fuel, this mod introduces the human element.

The Engineer is no longer just building a machine; they are cultivating a society. To progress from the Stone Age to the Information Age, the player must manage a workforce, ensuring they are housed, fed, and equipped, while simultaneously navigating complex, realistic production chains.

2. Core Pillars

A. The Human Resource (Labor Force)

In Ages of Industry, automation is not free.

Workforce Requirements: Most early production buildings (Assemblers, Mines, Refineries) require people to power them. A person has a limited amount of energy and need to be rotated out of the production buildings in order to feed them back in their housing units. 

Population Management: Players must build Housing blocks. The quality and quantity of housing determine the available workforce. 

Needs & Upkeep: People consume Calories (Food) and Water. A person has a calorie tank that gets depleted while operating production buildings. When a person's energy is depleted, they can be extracted from the production facility and sent back to an available housing unit for their energy to be replenished. 



B. The Era System (Progression)

Technology is gated not just by science packs, but by "Ages." Unlocking a new Age requires a monumental construct (e.g., a Town Hall, Capitol, or Mainframe) and specific population thresholds.

Stone Age: Manual gathering, basic tools, fire, stone masonry.

Agricultural Age: Domestication of animals, farming, weaving, pottery.

Bronze Age: Metallurgy, alloys, simple currency, writing.

Iron Age: Advanced mining, steel, complex mechanics, horse-drawn logistics.

Industrial Age: Steam power, coal, railways, mass manufacturing.

Information Age: Electronics, computing, global logistics, satellites.


C. Realistic Supply Chains

The mod emphasizes realism in processing. Waste products (sawdust, manure, etc.) are valuable byproducts for other industries.

3. Key Systems & Mechanics

Agriculture & Husbandry

The foundation of the labor force. Farming is not "set and forget"; it requires distinct inputs.

Crops: Wheat, Corn, Cotton.

Chain: Wheat → Threshing → Grain + Straw. Grain → Milling → Flour → Bread.

Livestock: Sheep, Cattle, Horses.

Inputs: Water, Fodder (made from Corn/Straw).

Outputs: Wool, Leather (Hides), Meat, Manure.

Manure Loop: Manure must be collected and processed into Fertilizer to maintain soil fertility for crops.

Fluid Mechanics: Water Management

Water is no longer generic.

Fresh Water: Required for Population, Horses, and Crops.

Salt Water: Extracted for Salt (preservative) and brine electrolysis.

Waste Water: Cities and factories produce pollution that must be filtered.

Mobility & Logistics

Domestication: Early game mobility is solved via Horses. The player can craft stables and saddles to increase movement speed before cars or trains are unlocked.

Horse drawn carts can be developed to act as drivable storage chests. 

Forestry & Paper

Wood processing is expanded significantly.

Lumber: Wood → Planks + Sawdust.

Pulp: Sawdust + water

Paper: Pulp + Press → Paper.

Knowledge: Paper + Leather (Binding) → Books.

Usage: Books are consumed by "School" buildings to generate early-game Science (replacing Red Science automation logic).

4. Detailed Resource Examples

Category

Primary Resources

Intermediate Products

Final Applications

Livestock

Cattle, Sheep, Horses

Raw Hide, Wool, Manure, Meat

Leather Armor, Warm Clothing (Winter mechanic?), Fertilizer, Food

Farming

Wheat, Corn, Fodder

Flour, Starch, Straw, Seeds

Bread (Standard Ration), Bio-fuel, Animal Feed

Minerals

Stone, Clay, Salt, Coal

Bricks, Ceramics, Glass

Housing, Storage, Basic Science

Forestry

Wood

Sawdust, Charcoal, Pulp

Paper (Science), Fuel, Filters

5. Technical Implementation Goals

Custom GUI: A "Civilization Status" window showing total population, hunger levels, and current Age.

Entities: distinct graphics for Farms (3x3 or 5x5 plots), Pastures, and different tiers of Housing (Huts vs. Brick Houses vs. Apartments).


6. Summary

Factorio: Ages of Industry challenges the player to be not just an engineer, but a governor. It slows down the early game to appreciate the struggle of survival and expands the late game into a management sim of a thriving, industrial empire.