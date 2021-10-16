local analyserNode = {}
local fft = require "fft"
local complex = require "complexArray"

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
            local arrray = {}
            if (src~=nil and source == nil) then
                source = src
            end
            local fbc = object.frequencyBinCount
            local pl = source.PlaybackLoudness
            for i=1,fbc do
                array[i] = complex.new(getSmoothWave((pl*i/fbc)), 0)--complex.new(math.random(), 0)
            end
            local function divide(list, factor)
                local newList = {}
                for i,v in ipairs(list) do newList[i] = list[i] / factor end
                return newList
            end
            local newArray = fft(array, inverseBool)
            
            local newArray1 = divide(newArray, fbc)
            return newArray
        end
        return object
    end
end
