function label=decisionTreeTest(decisionTreeModel,sampleSet,propertyName)

lengthSample=size(sampleSet,1); %lengthSample 测试样本数量
label=zeros(lengthSample,1);   %label  测试样本分类结果 
for sampleIndex=1:lengthSample    %sampleindex 测试样本样本，遍历一遍
    sample=sampleSet(sampleIndex,:);  
    Nodes=decisionTreeModel.Node;  %
    rootNode=Nodes(1); %将根节点取出
    head=rootNode.NodeName; %根节点的属性
    index=GetFeatureNum(propertyName,head); %根节点属性对应着的下标，也就是列号
    edge=sample(index);  %属性对应的值
    k=1;
    level=1;
    while k<length(Nodes)
        k=k+1;
        if Nodes(k).level==level  %是否在同一层
            if strcmp(Nodes(k).fatherNodeName,head) 
                if Nodes(k).EdgeProperty==edge  
                    if Nodes(k).NodeName<5   %已经到叶子节点
                        label(sampleIndex)=Nodes(k).NodeName;
                        break;
                    else                     %未到叶子节点，递归搜索
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
