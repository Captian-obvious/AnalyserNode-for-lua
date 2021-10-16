local analyserNode = {}
local fft = require "fft"
local complex = require "complexArray"

function getSmoothWave(x, fbc)
    return math.sin(tick())*(x*i/fbc*2*math.pi)*255
end

function analyserNode.CreateAnalyser(s, src)
    if (newSize < 2^5 or newSize > 2^15) then
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
            local fbc = object.frequencyBinCount
            for i=1,fbc do
                array[i] = complex.new(math.sin(2* i/fbc * 2*math.pi) + math.sin(10* i/fbc * 2*math.pi), 0)--complex.new(math.random(), 0)
            end
            local function devide(list, factor)
                local newList = {}
                for i,v in ipairs(list) do newList[i] = list[i] / factor end
                return newList
            end
            local newArray = divide(array, fbc)
            return newArray
        end
        return object
    end
end
