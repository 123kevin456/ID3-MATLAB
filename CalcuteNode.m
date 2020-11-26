function [NodeIndex,BuildNode]=CalcuteNode(data,label,delta)

LargeEntropy=CEntropy(label);
[m,n]=size(data);
EntropyGain=LargeEntropy*ones(1,n);
BuildNode=true;
for i=1:n
    pData=data(:,i);
    itemList=unique(pData);
    for j=1:length(itemList)
        itemIndex=find(pData==itemList(j));
        EntropyGain(i)=EntropyGain(i)-length(itemIndex)/m*CEntropy(label(itemIndex));
    end
    % 此处运行则为增益，下一行注释掉的为增益率
    % EntropyGain(i)=EntropyGain(i)/CEntropy(pData); 
end
[maxGainEntropy,NodeIndex]=max(EntropyGain);
if maxGainEntropy<delta %最佳属性带来的信息熵增益小于门限值
    BuildNode = false;
end
end
