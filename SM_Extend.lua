function RekCdCheck()
	local _,_,offset,numSpells = GetSpellTabInfo(GetNumSpellTabs())
	local numAllSpell = offset + numSpells;
	for i=1,numAllSpell do
	local name = GetSpellName(i,"BOOKTYPE_SPELL");
	if ( name == "Recklessness" ) then
		RekT,RekCD = GetSpellCooldown(i,"BOOKTYPE_SPELL")
		return RekCD
	end
	end
end

function NoseDance()
	local RekCD = RekCdCheck()

	if buffed("Battle Stance"."player") and not buffed("Recklessness","player") and RekCD==0 then 
		CastSpellByName("Berserker Stance",1)
	end;
	if buffed("Berserker Stance"."player") and not buffed("Recklessness","player") and RekCD==0 then
		CastSpellByName("Recklessness",1)
	end;
	if buffed("Berserker Stance"."player") and buffed("Recklessness","player") then
		CastSpellByName("Battle Stance",1)
	end;
	if buffed("Berserker Stance"."player") and not buffed("Recklessness","player") and RekCD~=0 then --dispel failsafe, may be unnecessary
		CastSpellByName("Battle Stance",1)
	end;
end