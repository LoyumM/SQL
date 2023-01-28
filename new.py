lis = list(map(int, input().split()))
print(lis)
number = lis[0]
for current_number in lis:
    if current_number > number:
        number = current_number
print("Max number is :", number)
       