local analyserNode = require(script.AnalyserNode);

local audioNode = {};

function audioNode.new(src)
    if not src then
        src = Instance.new("Sound",workspace);
    end;
    local object = {
        Source = src;
    };
    function object.CreateAnalyser(fftSize)
        return analyserNode.CreateAnalyser(object.Source, fftSize);
    end;
    function object.CreateGain()
        local object1 = {};
        function object.SetGainAtTime(multiplier);
            local max = 10;
            src.Volume = max * multiplier;
        end;
        return object1;
    end;
    return object;
end;

return audioNode;
