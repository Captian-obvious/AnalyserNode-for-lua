local analyserNode = require(script.AnalyserNode);
local audioNode = {};

function audioNode.new(src)
    local object = {};
    if not src then
        src = Instance.new("Sound",workspace)
    end
    object.Source = src
    function object.CreateAnalyser(fftSize)
        return analyserNode.CreateAnalyser(src, fftSize)
    end
    function object.CreateGain()
        
    end
end

return audioNode;
