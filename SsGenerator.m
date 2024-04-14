classdef SsGenerator<handle
    properties
        % generators for signals
        PSS
        SSS
    end
    
    
    methods
        % initializing
        function obj=SsGenerator()
            obj.PSS=PssGenerator();
            obj.SSS=SssGenerator();
        end
        function [pss,sss]=getSsSignalsByCellInfo(obj,NCellId)
            % get signals from generators
            pss=obj.PSS.generatePssByCellInfo(NCellId);
            sss=obj.SSS.generateSssByCellInfo(NCellId).';
        end
    end
end