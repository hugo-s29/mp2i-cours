# should be ran in email-auto/

with open('src/counter.txt') as f:
    week_num, real_week_num = list(map(int, f.read().split(';')))

with open('src/counter.txt', 'w') as f:
    f.write('%s;%s' % (week_num + 1, real_week_num + 1))
