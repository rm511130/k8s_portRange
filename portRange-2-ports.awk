{
#    AWK code to convert from portRange to K8's port syntax
#    $ cat networkpolicy_with_portRange.yaml | awk -f thisfile.awk > K8sSyntaxNetworkPolicy.yaml
#
#    ports:                                                   ports:
#    - protocol: TCP                ---> becomes --->         - protocol: TCP
#      portRange: 5978:5980                                     port: 5978
#                                                             - protocol: TCP
#                                                               port: 5979
#                                                             - protocol: TCP
#                                                               port: 5980
#                       

if (match($0,"portRange:"))
  { 
    split($0, part, ":")
    for (i = part[2]; i <= part[3]; i++)
       { 
         if ( i > part[2]) print previous;
         printf("      port: %d\n",i)
       }
  } 
else 
  { 
    print $0 
    previous=$0;
  } 
}

   
