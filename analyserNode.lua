local analyserNode = {}

function getSmoothWave(x)
    return math.sin(tick())*(x*2*math.pi)*255
end

--PV stands for Perfered Value

function getPV(value, frequencyBinCount)
    
end

function quadIn(...)
    
end

function inverse(n)
    return (1/n)
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
            local p = source.PlaybackLoudness
            array[1] = p * 255
            array[2] = p * 245
            local v = p * object.frequencyBinCount
            local nv = getPV(p, object.frequencyBinCount)
            while i<#object.frequencyBinCount - 2 do
                runServ.Stepped:Wait()
            end
        end
        return object
    end
end
