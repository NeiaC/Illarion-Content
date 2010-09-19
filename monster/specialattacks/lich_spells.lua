-- This is the script handeling the special attacks for the "Lich Overlord".
-- Lich will also use SuddenWarp, CastParalyze,CastMonster(needs to be modified) and CastMonMagic
-- Done by Grim

module("monster.specialattacks.lich_spells", package.seeall)
function Lich_MagicShield (monster, char)
-- Magic shield: If the boss is being cast on, he casts back a massive spell of doom on a) the caster b) a random char around (to be used with onCasted function)
	if (math.random(100)<= 90) then
		if (math.random(100)<= 80) then
			monster:talk(CCharacter.say, "Your efforts are worthless, mortal.. Come, embrace death.");
			char:increaseAttrib ("hitpoints",-4000);
			char.movepoints = 0;
		else
			monster:talk(CCharacter.say, "You shouldn't toy with powers you cannot understand, mortal.");
			CharList={};
			local position = monster.pos;
			CharList = world:getCharactersInRangeOf (position, 5);
			x=0;
			for i=0,table.getn(CharList) do
				while x < 3 do
					char[math.random(table.getn(CharList))]:increaseAttrib ("hitpoints",-2500);
					x = x +1;
				end
			end
		end
	else
		return false;
	end
end

function Lich_Forcefield (monster, char)
--  Forcefield: If the boss is attacked with weapons, the attacker gets a ray of energy in his face (to be used with onAttacked function)
	if (math.random(100)<= 70) then
		monster:talk(CCharacter.say, "You want to destroy me..? You can not kill enthernity!");
		char:increaseAttrib ("hitpoints",-3000);
	else
		return false;
	end
end

	
					