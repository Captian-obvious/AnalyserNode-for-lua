local analyserNode = require(script.Parent.AnalyserNode);
local audioNode = {};

function audioNode.new()
    local object = {};
    function object.CreateAnalyser(fftSize)
        local object = analyserNode.CreateAnalyser(fftSize)
        return object
    end
    function object.CreateGain()
        
    end
end

return audioNode;
