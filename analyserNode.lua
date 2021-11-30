local analyserNode = {}

function getSmoothWave(x)
    return math.sin(tick())*(x*2*math.pi)*255
end

--PV stands for Perfered Value

-- in-situ reversal
function reverse(t)
    local n = #t
    local r = {};
    local i = 1
    for i = 1, #t do
        r[i] = t[n];
        r[n] = t[i];
        n = n - 1;
    end
    return r
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
        local mpl = 0
        function object:GetByteFrequencyData(audio) --if not already specified this line allows an src to be changed--
            local array = {}
            if audio then
                src = audio
            end
            local pl = audio.PlaybackLoudness
            mpl = math.max(pl,mpl)
            pl = pl/mpl
            --[[
            local v = math.floor(pl * object.frequencyBinCount)
            local pv = pl * 255
            local n = v
            if n > 2 then
                array[v] = pv
            end
            array = reverse(array)
            ]]--
            array[tick()] = pl
            fft(array, false)
            return array
        end
        return object
    end
end

return analyserNode
