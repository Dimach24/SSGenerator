classdef SsGenerator
    properties
        PSS
        SSS
    end
    
    
    methods
        function obj=SsGenerator()
            obj.PSS=PssGenerator();
            obj.SSS=SssGenerator();
        end
        function [pss,sss]=getSsSignalsByCellInfo(obj,NCellId)
            pss=obj.PSS.generatePssByCellInfo(NCellId);
            sss=obj.SSS.generateSssByCellInfo(NCellId).';
        end
    end
end