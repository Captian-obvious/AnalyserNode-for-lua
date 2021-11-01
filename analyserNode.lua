local analyserNode = {}

function getSmoothWave(x)
    return math.sin(tick())*(x*2*math.pi)*255
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
        function object:GetByteFrequencyData(inverseBool, src) --if not already specified this line allows an src to be changed--
            local array = {}
            if (src~=nil and source == nil) then
                source = src
            end
            local p = source.PlaybackLoudness
            local v = p * object.frequencyBinCount
            local nv = getPV(p)
            while i<#object.frequencyBinCount do
                runServ.Stepped:Wait()
            end
        end
        return object
    end
end
