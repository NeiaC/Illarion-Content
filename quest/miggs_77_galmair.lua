-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (77, 'quest.miggs_77_galmair');

require("base.common")
module("quest.miggs_77_galmair", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Die Kanalisation von Galmair"
Title[ENGLISH] = "Galmair Sewers"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Gehe hinunter in die Kanalisation und töte 10 Schleime. Nehme dazu am Besten die Fackel oder eine andere Waffe in die Hand."
Description[ENGLISH][1] = "Go down into the sewers and kill ten slimes. Take the torch or another weapon in your hand."
Description[GERMAN][2] = "Töte noch 9 Schleime in die Kanalisation."
Description[ENGLISH][2] = "Kill 9 slimes in the sewers."
Description[GERMAN][3] = "Töte noch 8 Schleime in die Kanalisation."
Description[ENGLISH][3] = "Kill 8 slimes in the sewers."
Description[GERMAN][4] = "Töte noch 7 Schleime in die Kanalisation."
Description[ENGLISH][4] = "Kill 7 slimes in the sewers."
Description[GERMAN][5] = "Töte noch 6 Schleime in die Kanalisation."
Description[ENGLISH][5] = "Kill 6 slimes in the sewers."
Description[GERMAN][6] = "Töte noch 5 Schleime in die Kanalisation."
Description[ENGLISH][6] = "Kill 5 slimes in the sewers."
Description[GERMAN][7] = "Töte noch 4 Schleime in die Kanalisation."
Description[ENGLISH][7] = "Kill 4 slimes in the sewers."
Description[GERMAN][8] = "Töte noch 3 Schleime in die Kanalisation."
Description[ENGLISH][8] = "Kill 3 slimes in the sewers."
Description[GERMAN][9] = "Töte noch 2 Schleime in die Kanalisation."
Description[ENGLISH][9] = "Kill 2 slimes in the sewers."
Description[GERMAN][10] = "Töte noch einen Schleim in die Kanalisation."
Description[ENGLISH][10] = "Kill one slime in the sewers."
Description[GERMAN][11] = "Kehre zu Miggs zurück."
Description[ENGLISH][11] = "Return to Miggs."
Description[GERMAN][12] = "Gehe zu Miggs, der sich in der Bibliothek von Galmair aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][12] = "Go back to Miggs in the library of Galmair, he certainly have another task for you."
Description[GERMAN][13] = "Gehe hinunter in die Kanalisation und töte fünf Mumien. Nehme dazu am Besten die Fackel oder eine andere Waffe in die Hand."
Description[ENGLISH][13] = "Go down into the sewers and kill five mummies. Take the torch or another weapon in your hand."
Description[GERMAN][14] = "Töte noch 4 Mumien in die Kanalisation."
Description[ENGLISH][14] = "Kill 4 mummies in the sewers."
Description[GERMAN][15] = "Töte noch 3 Mumien in die Kanalisation."
Description[ENGLISH][15] = "Kill 3 mummies in the sewers."
Description[GERMAN][16] = "Töte noch 2 Mumien in die Kanalisation."
Description[ENGLISH][16] = "Kill 2 mummies in the sewers."
Description[GERMAN][17] = "Töte noch eine Mumie in die Kanalisation."
Description[ENGLISH][17] = "Kill one mummy in the sewers."
Description[GERMAN][18] = "Kehre zu Miggs zurück."
Description[ENGLISH][18] = "Return to Miggs."
Description[GERMAN][19] = "Gehe zu Miggs, der sich in der Bibliothek von Galmair aufhält. Er hat bestimmt noch eine Aufgabe für dich."
Description[ENGLISH][19] = "Go back to Miggs in the library of Galmair, he certainly have another task for you."
Description[GERMAN][20] = "Töte den Halblingdieb in der Kanalisation. Nehme dazu am Besten eine Waffe in die Hand."
Description[ENGLISH][20] = "Go down into the sewers and kill the halfling thief. Take for it a weapon in your hand."
Description[GERMAN][21] = "Kehre zu Miggs zurück."
Description[ENGLISH][21] = "Return to Miggs."
Description[GERMAN][22] = "Du hast alle Aufgaben von Miggs erfüllt."
Description[ENGLISH][22] = "You have fulfilled all tasks for Miggs."


-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[1] = {position(303, 338, -6)} 
QuestTarget[2] = {position(303, 338, -6)} 
QuestTarget[3] = {position(303, 338, -6)} 
QuestTarget[4] = {position(303, 338, -6)}
QuestTarget[5] = {position(303, 338, -6)} 
QuestTarget[6] = {position(303, 338, -6)}
QuestTarget[7] = {position(303, 338, -6)} 
QuestTarget[8] = {position(303, 338, -6)} 
QuestTarget[9] = {position(303, 338, -6)} 
QuestTarget[10] = {position(303, 338, -6)}
QuestTarget[11] = {position(374, 216, 0)} 
QuestTarget[12] = {position(374, 216, 0)}
QuestTarget[13] = {position(303, 338, -6)} 
QuestTarget[14] = {position(303, 338, -6)} 
QuestTarget[15] = {position(303, 338, -6)} 
QuestTarget[16] = {position(303, 338, -6)}
QuestTarget[17] = {position(303, 338, -6)} 
QuestTarget[18] = {position(374, 216, 0)}
QuestTarget[19] = {position(374, 216, 0)} 
QuestTarget[20] = {position(293, 328, -6)} 
QuestTarget[21] = {position(374, 216, 0)} 
QuestTarget[22] = {position(374, 216, 0)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 22


function QuestTitle(user)
    return base.common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return base.common.GetNLS(user, german, english)
end

function QuestTargets(user, status)
    return QuestTarget[status]
end

function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end