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



--DAIMON----DAIMON----DAIMON----DAIMON----DAIMON----DAIMON----DAIMON----DAIMON----DAIMON----DAIMON----DAIMON----DAIMON----DAIMON----DAIMON----DAIMON----DAIMON----DAIMON--

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

if movePC_player1 == 0x00034F6A and movePC_player2 == 0x00035194 and newTrigger == 0xAE --final hit of super move
	then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
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


--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO--KYO

-- Absolute Flair QCF x 2 + P
if movePC_player1 == 0x000317D2 and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

-- Orochinagi QCB, HCF + P
if movePC_player1 == 0x0003141E and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

-- Flaming uppercut UCM + P
if movePC_player1 == 0x000163F4 and newTrigger == 0x3C and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

-- R.E.D Kick UCM Backwards + K
if movePC_player1 == 0x000163F4 and newTrigger == 0x72 and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

-- Lightshine Explosion HCB + K
if movePC_player1 == 0x00016402 and newTrigger == 0x36 and P2_hasBeenDamaged~=0 --hit 1 of 3
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

if movePC_player1 == 0x00030254 and P2_hasBeenDamaged~=0 --hit 2 of 2
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

-- Crane Sweeper QCB + P
if (movePC_player1 == 0x000310E4 or movePC_player1 == 0x000310C4 or movePC_player1 == 0x0003111c) and (P2_hasBeenDamaged~=0 or movePC_player2 == 0x18a3a)
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

-- Number 75 Kick QCF + B x 2 -or- D x 2
if movePC_player1 == 0x00030534 and P2_hasBeenDamaged~=0 --hit 1 of 2
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

if movePC_player1 == 0x0003058C and P2_hasBeenDamaged~=0 --hit 2 of 2 (button D)
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

if movePC_player1 == 0x00030618 and newTrigger == 0x0C --hit 2 of 2 (button B)
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end


-- Flame Smash QCF + A
if movePC_player1 == 0x000163F4 and newTrigger == 0xB4 and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

-- Nice Wound QCF + P   From Flame Smash
if movePC_player1 == 0x00030716 and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

-- Rust Slam HCB + P   From Flame Smash -or- P  From Nice Wound
if movePC_player1 == 0x00030A9E and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

-- Sea Slash K         From Nice Wound or Rust Slam
if movePC_player1 == 0x000309E8 and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

-- Venom Bite QCF + C
if movePC_player1 == 0x00030CE2 and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

-- Sin Smash HCB + P   From Venom Bite
if movePC_player1 == 0x00016402 and newTrigger == 0x78 and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

-- Guilt Smash F   + P   From Sin Smash
if movePC_player1 == 0x00030E9E and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end


--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI--IORI

-- QCF + P  (fireball creates too many false positives)
--if movePC_player2 == 0x00018a3a and P2_hasBeenDamaged~=0 and mem:read_u8(0x108179)==0x99
--then	
--	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
--	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
--	end
--end

--QCB + P ( x3 ) 1 and 2 of 3
if movePC_player1 == 0x5fab2 and movePC_player2 == 0x18a3a --P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

--QCB + P ( x3 ) 3 of 3
if movePC_player1 == 0x5fa5a and newTrigger == 0x24 and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

--DP + P
if movePC_player1 == 0x5f344 and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

--HCB + K
if (movePC_player1 == 0x5F5BE or movePC_player1 == 0x5F62E) and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

--QCF , HCB + P
if movePC_player1 == 0x60018 and P2_hasBeenDamaged~=0
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

if movePC_player1 == 0x60102 and P2_hasBeenDamaged~=0 --final hit
then	
	if playerOnLeft == 0 then DisplayBoxLeft = displayAmount
	elseif playerOnLeft == 1 then DisplayBoxRight = displayAmount
	end
end

--GENERAL--GENERAL--GENERAL--GENERAL--GENERAL--GENERAL--GENERAL--GENERAL--GENERAL--GENERAL--GENERAL--GENERAL--GENERAL--GENERAL--GENERAL--GENERAL
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