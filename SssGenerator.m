classdef SssGenerator
    properties
        x0;
        x1;
    end
    methods
        %   Constructor
        function obj = SssGenerator()
            %   Compute M-seq. at first
            obj.x0=mSequence(7,[1,0,0,0,0,0,0],[0,1,0,0,0,1,0,0]);
            obj.x1=mSequence(7,[1,0,0,0,0,0,0],[0,1,1,0,0,0,0,0]);
        end

        function dsss_n=d_sss(obj,Nid1,Nid2,n)
            %   index of shift for the 1st M-seq
            m0=15*floor(Nid1/112)+5*Nid2;
            %   same for 2nd
            m1=mod(Nid1,112);
            
            %   shifting indexes
            m0=mod(m0+n,127);
            m1=mod(m1+n,127);
            
            dsss_n=(1-2*obj.x0(m0+1))*(1-2*obj.x1(m1+1));
        end

        function dsss=generateSssByCellInfo(obj,NCellId)
            arguments
                obj
                NCellId        (1,1)
            end
                Nid2=mod(NCellId,3);
                Nid1=floor(NCellId/3);

            dsss=zeros(127,1);
            for n=0:126
                dsss(n+1,1)=d_sss(obj,Nid1,Nid2,n);
            end
        end
    end
end