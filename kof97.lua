cpu = manager.machine.devices[":maincpu"]
mem = cpu.spaces["program"]
gui = manager.machine.screens[":screen"]

DisplayBoxLeft = 0
DisplayBoxRight = 0
displayAmount = 12

playerOnLeft = 1

function main()

playerOnLeft = mem:read_u8(0x108131)

trigger = mem:read_u16(0x10152a)

newTrigger = mem:read_u8(0x108175)

movePC_player1 = mem:read_u32(0x108100)
movePC_player2 = mem:read_u32(0x108300)

explosion_player1 = mem:read_u16(0x1081EA)

superflash_player1 = mem:read_u8(0x10A787)

P2_hasBeenDamaged = mem:read_u16(0x10843b)
--P2_hasBeenDamaged = mem:read_u16(0x10823b) --set to p1 for testing

if DisplayBoxLeft > 0
then
	DisplayBoxLeft = DisplayBoxLeft - 1
end

if DisplayBoxRight > 0
then
	DisplayBoxRight = DisplayBoxRight - 1
end


--近敌时→↘↓↙←→↘↓↙←＋ＡorＣ

if (newTrigger == 0x7e or newTrigger==0x8A or newTrigger == 0x12 or newTrigger == 0x18 or newTrigger == 0x96 or newTrigger == 0x72) and movePC_player1 ==0x00034F6A and P2_hasBeenDamaged~=0 --first and many subsequent hits
	then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end


if (newTrigger == 0x48 or newTrigger == 0x54 or newTrigger==0x3c) and movePC_player1 ==0x00034F6A and P2_hasBeenDamaged~=0 --one of the two sets of slammings
	then	
	if playerOnLeft == 1 then DisplayBoxLeft = displayAmount --note that this is not zero
	elseif  playerOnLeft == 0 then DisplayBoxRight = displayAmount
	end
end

if newTrigger == 0x42 and movePC_player1 ==0x00034206 and P2_hasBeenDamaged~=0  --ending slam
	then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount --note that this is zero
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

if newTrigger == 0x96 and movePC_player1 ==0x00034F6A and P2_hasBeenDamaged~=0
	then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif  playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

if movePC_player1 == 0x000341CC and movePC_player2 == 0x000351C4
	then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif  playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

if movePC_player1 == 0x00034206 and movePC_player2 == 0x000184DA-- and P2_hasBeenDamaged==0
	then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif  playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

--近敌时←↙↓↘→←↙↓↘→＋ＢorＤ
if movePC_player1 == 0x00035372 --and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 1 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 0 then DisplayBoxRight = displayAmount
	end
end


--近敌时←↙↓↘→＋ＡorＣ

if movePC_player1 == 0x00034802 and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 1 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 0 then DisplayBoxRight = displayAmount
	end
end

if (newTrigger == 0x42 or newTrigger == 0x48) and movePC_player2 == 0x00034460
	then	
	if playerOnLeft == 1 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 0 then DisplayBoxRight = displayAmount
	end
end


--近敌时→↘↓↙←→＋ＢorＤ
if movePC_player1 == 0x00034C42 and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 1 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 0 then DisplayBoxRight = displayAmount
	end
end



--近敌时→↘↓↙←→＋ＡorＣ
if movePC_player1 == 0x00034D2C and P2_hasBeenDamaged~=0 --first hit
then	
	if playerOnLeft == 1 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 0 then DisplayBoxRight = displayAmount
	end
end


if movePC_player2 == 0x00034E1C and P2_hasBeenDamaged~=0 --second hit
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

--super flash

if superflash_player1 > 0x00
then
	DisplayBoxLeft = displayAmount
	DisplayBoxRight = displayAmount
end

--ADVANCED mode A+B+C burst

if ((explosion_player1 >= 0x3f00) and (explosion_player1 <0x5000))
then
	DisplayBoxLeft = displayAmount
	DisplayBoxRight = displayAmount
end

--create the box
	if DisplayBoxLeft > 0
	then	
		drawbox(0, DisplayBoxLeft)
	end

	if DisplayBoxRight > 0
	then	
		drawbox(320-(12*8), DisplayBoxRight)
	end

end

function drawbox(drawx, size)
	gui:draw_box(drawx,0,drawx+(8*size),8*size,0xFF00FF00)
end

emu.register_frame_done(main, "frame")