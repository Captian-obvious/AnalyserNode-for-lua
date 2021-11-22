local analyserNode = {}

function getSmoothWave(x)
    return math.sin(tick())*(x*2*math.pi)*255
end

--PV stands for Perfered Value

function inverse(n)
    if n>0 then
        return (n^(-1))
    else
        warn("Cannot Divide By Zero")
        return 0
    end
end

function analyserNode.CreateAnalyser(s,src)
    if (s < 2^5 or s > 2^15) then
        error("DOM Exception: Index Size Error")
        return
    else
        local object = {
            frequencyBinCount=s/2;
            fftSize = s;
        };
        function object:SetFFTSize(newSize)
            if (newSize < 2^5 or newSize > 2^15) then
                error("DOM Exception: Index Size Error")
                return
            else
                object.fftSize = newSize
            end
        end
        function object:GetByteFrequencyData(audio) --if not already specified this line allows an src to be changed--
            local array = {}
            if audio then 
                src = audio
            end
            local pl = audio.PlaybackLoudness
            array[1] = pl * 255
            array[2] = pl * 245
            local v = math.floor(pl * object.frequencyBinCount)
            local pv = pl * 255
            local n = v
            if n > 2 then
                array[n] = pv
                if n>1 then
                    local nS=array[n-1]
                    local n1 = n-1
                    if pv>nS then
                        array[n1] = nS+(pv-nS)/3
                    end
                end
                if n<object.frequencyBinCount then
                    local nS=array[n+1]
                    local n1 = n+1
                    if pv>nS then
                        array[n1] = nS+(pv-nS)/3
                    end
                end
            end
            return array
        end
        return object
    end
end

return analyserNode
