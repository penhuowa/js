#!/bin/bash
2
​
3
# 获取环境变量列表，假设环境变量以 ACCOUNT_AUTH_N 的形式命名
4
auth_variables=($(env | grep '^ACCOUNT_AUTH_' | cut -d '=' -f1))
5
​
6
for var in "${auth_variables[@]}"; do
7
  # 提取Token
8
  auth=$(eval echo \$$var)
9
​
10
  echo "正在进行第${var##*_}个账号签到..."
11
​
12
  # 执行签到请求
13
  curl -X GET "https://api-cdn.taoqitu.pro/gateway/tqt/cn/user/sign" \
14
  -H "Accept-Encoding: gzip, deflate, br" \
15
  -H "Origin: https://vip.taoqitu.pro" \
16
  -H "Connection: keep-alive" \
17
  -H "Accept: */*" \
18
  -H "Referer: https://vip.taoqitu.pro/" \
19
  -H "Host: api-cdn.taoqitu.pro" \
20
  -H "User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1" \
21
  -H "Authorization: ${auth}" \
22
  -H "Accept-Language: zh-CN,zh-Hans;q=0.9"
23
​
24
  # 根据实际情况，可以在这里添加必要的延时防止请求过快被封禁
25
  sleep 2 # 示例延时2秒
26
done
27
​
