function result=GetFeatureNum(propertyName,str)
result=0;
for i=1:length(propertyName)
    if strcmp(propertyName{i},str)==1
        result=i;
        break;
    end
end
