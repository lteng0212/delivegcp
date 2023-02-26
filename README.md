# delivegcp

1. device_name gcp这种名称如果不填 需要设置成null，而不是不设置变量
2. 通过 ip_cidr_range 形式来指定辅助ip
3. 谷歌没有容灾组的概念 通过实例组来进行自动修复和负载均衡