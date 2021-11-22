local analyserNode = require(script.Parent.AnalyserNode);
local audioNode = {};

function audioNode.new(src)
    local object = {};
    if not src then
        src = Instance.new("Sound",workspace)
    end
    object.Source = src
    function object.CreateAnalyser(fftSize)
        local object = analyserNode.CreateAnalyser(fftSize)
        return object
    end
    function object.CreateGain()
        
    end
end

return audioNode;
