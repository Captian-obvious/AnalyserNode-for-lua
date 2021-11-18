local analyserNode = {}

function getSmoothWave(x)
	return math.sin(tick())*(x*2*math.pi)*255
end

--PV stands for Perfered Value

function quadIn(t,b,c,d) 
	t=t/d; 
	return c*t*t+b; 
end;
function quadOut(t,b,c,d) 
	t=t/d; 
	return -c*t*(t-2)+b; 
end;

function inverse(n)
	return (1/n)
end

function CheckSet(array,N,N1,S,D) -- Number, Scale, Direction
	local nS=array[N]
	if S>nS then
		Set(array,N1,nS+(S-nS)/3,D)
	end
end

function Set(array,fbc,N,S,D) -- Number, Scale, Direction
	if N < fbc - 2 then
		array[N] = S
		if N>0 and D~=1 then -- Checks left for smaller bars to manipulate
			CheckSet(array,N,N-1,S,-1)
		end
		if N<fbc and D~=-1 then -- Checks right...
			CheckSet(array,N,N+1,S,1)
		end
	else
		return
	end
end

function analyserNode.CreateAnalyser(s, source)
	if (s < 2^5 or s > 2^15) then
		error("DOM Exception: Index Size Error")
		return
	else
		local object = {
			frequencyBinCount=s/2;
			fftSize = s;
		}
		function object:SetFFTSize(newSize)
			if (newSize < 2^5 or newSize > 2^15) then
				error("DOM Exception: Index Size Error")
				return
			else
				object.fftSize = newSize
			end
		end
		function object:GetByteFrequencyData(src, max) --if not already specified this line allows an src to be changed--
			local array = {}
			if (src~=nil and source == nil) then
				source = src
			end
			local i = 0
			local p = src.PlaybackLoudness
			array[1] = p * 255
			array[2] = p * 245
			local v = inverse(math.floor(p * object.frequencyBinCount))
			local pv = p * 255
			if (v * object.frequencyBinCount) > 2 then
				Set(array,object.frequencyBinCount,object.frequencyBinCount*v,pv,0)
			end
			return array
		end
		return object
	end
end

return analyserNode

