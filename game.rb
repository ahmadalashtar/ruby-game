def game
#definitions
    difficulty = 10
    endGame = false
    timeLimit = 10.0
    points = 0
#end of definitions
    p "START"
    while endGame == false
        a = getRandom(difficulty/5)
        (0...a.length-1).each do |b|
            if a[b] > -1 and b != 0
                print "+"
                print a[b]
                print " "
            else
                print a[b]
                print " "
            end
        end
        puts
        start = Time.now
        number = gets.chomp.to_i
        finish = Time.now
        answerTime = finish-start
        puts answerTime.round
        if number == a[-1] and answerTime <= timeLimit
            points += ((difficulty/5)-1)*(timeLimit-answerTime)
            difficulty += 1
            puts "+++"
            print "points "
            puts points
            print " timeLimit "
            puts timeLimit
            timeLimit -= 0.3
        elsif number == a[-1] and answerTime > timeLimit
                puts "LOST ON TIME!"
                print "points "
                print points.round
                print " timeLimit "
                puts timeLimit
                endGame = true
        elsif number != a[-1]  and answerTime <= timeLimit
            if difficulty > 12
                difficulty -= 3
                puts "---"
                if points <= 10
                    points -= 10
                end
            else
                puts "LOST!"
                print "points "
                print " timeLimit "
                puts timeLimit
                print points.round
                print " timeLimit "
                print timeLimit
                endGame = true
            end
        end
    end
end

def getRandom(n)
    sum = 0
    a = []
    (0...n).each do |b|
        a << rand(-9..9)
        sum+=a[b]
    end
    (0...a.length).each do |b|
        if sum > 9 and a[b] > 0
            a[b] -= 2*a[b]
            sum += 2*a[b]
        elsif sum < -9 and a[b] < 0
            a[b] -= 2*a[b]
            sum += 2*a[b]
        end
    end
    (0...a.length).each do |b|
        if sum < 0
            a[b] -= 2*a[b]
        end
    end
    sum = 0
    (0...a.length).each do |b|
        sum+=a[b]
    end
    a << sum
    return a
end

game
