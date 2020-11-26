function BuildTree(fatherlevel,fatherNodeName,edge,data,label,propertyName,delta)

global Node;

sonNode = struct('level',0,'fatherNodeName',[],'EdgeProperty',[],'NodeName',[]);
sonNode.level = fatherlevel+1;
sonNode.fatherNodeName = fatherNodeName;
sonNode.EdgeProperty = edge;

if length(unique(label))==1  %�о����Խ��Ϊͬһ���
    sonNode.NodeName = label(1);
    Node = [Node sonNode];
    return;
end

if length(propertyName)<1  %�������Զ��ľ�
    labelSet=unique(label);
    k=length(labelSet);
    labelNum=zeros(k,1);
    for i=1:k
        labelNum(i)=length(find(label==labelSet(i)));
    end
    [~,labelIndex]=max(labelNum);
    sonNode.NodeName=labelSet(labelIndex);
    Node=[Node sonNode];
    return;
end

%%%%%�����������
[sonIndex,BuildNode] = CalcuteNode(data,label,delta);

%%%%%�ݹ鹹�������
if BuildNode
    dataRowIndex = setdiff(1:length(propertyName),sonIndex); %����������޳�
    sonNode.NodeName = propertyName{sonIndex};
    Node=[Node sonNode];
    propertyName(sonIndex)=[];
    sonData=data(:,sonIndex);
    sonEdge=unique(sonData); %��ǰ�����м���ֵ

    for i=1:length(sonEdge)
        edgeDataIndex=find(sonData==sonEdge(i));
        BuildTree(sonNode.level,sonNode.NodeName,sonEdge(i),data(edgeDataIndex,dataRowIndex),label(edgeDataIndex,:),propertyName,delta);
    end
else
    %%%%ȡ�о�����������������һ��
    labelSet=unique(label);
    k=length(labelSet);
    labelNum=zeros(k,1);
    for i=1:k
        labelNum(i)=length(find(label==labelSet(i)));
    end
    [~,labelIndex]=max(labelNum);
    sonNode.NodeName=labelSet(labelIndex);
    Node=[Node sonNode];
    return;
end
