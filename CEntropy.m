function result=CEntropy(propertyList)

result=0;
totalLength=length(propertyList);
itemList=unique(propertyList);
pNum=length(itemList);
for i=1:pNum
    itemLength=length(find(propertyList==itemList(i)));
    pItem=itemLength/totalLength;
    result=result-pItem*log2(pItem);
end
