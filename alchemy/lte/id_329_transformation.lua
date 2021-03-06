--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
-- INSERT INTO longtimeeffects VALUES (329, 'alchemy_transformation', 'alchemy.lte.id_329_transformation');

local common = require("base.common")

local M = {}

function M.addEffect(Effect, User)
    --User:inform("debug func addEffect")
end

function M.callEffect(Effect,User)

    local findCounter,counterBlack = Effect:findValue("counterBlack")
    if findCounter then

        if counterBlack >= 1 then

            -- info that the effect will be removed soon
            if counterBlack == 2 then
                common.InformNLS( User,
                "Du sp�rst, wie ein Schauer �ber deinen K�rper l�uft. Deine Verwandlung wird nicht mehr lange andauern.",
                "Shortly, you feel a chill on your skin. Your transformation won't last a long time anymore."
                       )
            end
            counterBlack = counterBlack - 1 -- reduce of the effect counter
            Effect:addValue("counterBlack", counterBlack)
            local _, counterBlack2 = Effect:findValue("counterBlack")

            if counterBlack2 == 0 then
                -- the effect counter is down to zero; we change the char back
               return false
            end
        end
    end

    Effect.nextCalled = 600
    return true
end

local function TransformBack(Effect,User)
    local _, oldSkincolor1 = Effect:findValue("oldSkincolor1")
    local _, oldSkincolor2 = Effect:findValue("oldSkincolor2")
    local _, oldSkincolor3 = Effect:findValue("oldSkincolor3")
    local _, oldHaircolor1 = Effect:findValue("oldHaircolor1")
    local _, oldHaircolor2 = Effect:findValue("oldHaircolor2")
    local _, oldHaircolor3 = Effect:findValue("oldHaircolor3")
    local _, oldBeard = Effect:findValue("oldBeard")
    local _, oldHair = Effect:findValue("oldHair")
    local _, oldSex = Effect:findValue("oldSex")
    local _, oldRace = Effect:findValue("oldRace")
    local _, oldHeight = Effect:findValue("oldHeight")

    User:setRace(oldRace)
    User:setAttrib("body_height",oldHeight)

    User:setSkinColour(colour(oldSkincolor1,oldSkincolor2,oldSkincolor3))
    User:setHairColour(colour(oldHaircolor1,oldHaircolor2,oldHaircolor3))
    User:setBeard(oldBeard)
    User:setHair(oldHair)
    User:setAttrib("sex",oldSex)

 end

function M.removeEffect(Effect,User)
    TransformBack(Effect,User)
end

function M.loadEffect(Effect,User)
   local findCounter,counterBlack = Effect:findValue("counterBlack")
    if findCounter then
        if counterBlack > 0 then -- check if the actual effect is still active

            local findNewSkincolor1, newSkincolor1 = Effect:findValue("newSkincolor1")
            local _, newSkincolor2 = Effect:findValue("newSkincolor2")
            local _, newSkincolor3 = Effect:findValue("newSkincolor3")
            local findNewHaircolor1, newHaircolor1 = Effect:findValue("newHaircolor1")
            local _, newHaircolor2 = Effect:findValue("newHaircolor2")
            local _, newHaircolor3 = Effect:findValue("newHaircolor3")
            local findNewBeard, newBeard = Effect:findValue("newBeard")
            local findNewHair, newHair = Effect:findValue("newHair")
            local findNewSex, newSex = Effect:findValue("newSex")

            if findNewSkincolor1 then
                User:setSkinColour(colour(newSkincolor1,newSkincolor2,newSkincolor3))
            end
            if findNewHaircolor1 then
                User:setHairColour(colour(newHaircolor1,newHaircolor2,newHaircolor3))
            end
            if findNewBeard then
                User:setBeard(newBeard)
            end
            if findNewHair then
                User:setHair(newHair)
            end
            if findNewSex then
                User:setAttrib("sex",newSex)
            end

            local _, newRace = Effect:findValue("newRace")
            local _, newHeight = Effect:findValue("newHeight")

            User:setRace(newRace)
            User:setAttrib("body_height",newHeight)
       end
   end
end


return M

