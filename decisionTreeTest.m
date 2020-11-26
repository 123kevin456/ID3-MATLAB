function label=decisionTreeTest(decisionTreeModel,sampleSet,propertyName)

lengthSample=size(sampleSet,1); %lengthSample ������������
label=zeros(lengthSample,1);   %label  �������������� 
for sampleIndex=1:lengthSample    %sampleindex ������������������һ��
    sample=sampleSet(sampleIndex,:);  
    Nodes=decisionTreeModel.Node;  %
    rootNode=Nodes(1); %�����ڵ�ȡ��
    head=rootNode.NodeName; %���ڵ������
    index=GetFeatureNum(propertyName,head); %���ڵ����Զ�Ӧ�ŵ��±꣬Ҳ�����к�
    edge=sample(index);  %���Զ�Ӧ��ֵ
    k=1;
    level=1;
    while k<length(Nodes)
        k=k+1;
        if Nodes(k).level==level  %�Ƿ���ͬһ��
            if strcmp(Nodes(k).fatherNodeName,head) 
                if Nodes(k).EdgeProperty==edge  
                    if Nodes(k).NodeName<5   %�Ѿ���Ҷ�ӽڵ�
                        label(sampleIndex)=Nodes(k).NodeName;
                        break;
                    else                     %δ��Ҷ�ӽڵ㣬�ݹ�����
                        head=Nodes(k).NodeName;
                        index=GetFeatureNum(propertyName,head);
                        edge=sample(index);
                        level=level+1;
                    end
                end
            end
        end
    end
end
