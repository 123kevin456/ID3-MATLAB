function BuildTree(fatherlevel,fatherNodeName,edge,data,label,propertyName,delta)

global Node;

sonNode = struct('level',0,'fatherNodeName',[],'EdgeProperty',[],'NodeName',[]);
sonNode.level = fatherlevel+1;
sonNode.fatherNodeName = fatherNodeName;
sonNode.EdgeProperty = edge;

if length(unique(label))==1  %判决属性结果为同一类别
    sonNode.NodeName = label(1);
    Node = [Node sonNode];
    return;
end

if length(propertyName)<1  %所有属性都耗尽
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

%%%%%计算最佳属性
[sonIndex,BuildNode] = CalcuteNode(data,label,delta);

%%%%%递归构造决策树
if BuildNode
    dataRowIndex = setdiff(1:length(propertyName),sonIndex); %将最佳属性剔除
    sonNode.NodeName = propertyName{sonIndex};
    Node=[Node sonNode];
    propertyName(sonIndex)=[];
    sonData=data(:,sonIndex);
    sonEdge=unique(sonData); %当前属性有几个值

    for i=1:length(sonEdge)
        edgeDataIndex=find(sonData==sonEdge(i));
        BuildTree(sonNode.level,sonNode.NodeName,sonEdge(i),data(edgeDataIndex,dataRowIndex),label(edgeDataIndex,:),propertyName,delta);
    end
else
    %%%%取判决结果中类别数量最多的一类
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
