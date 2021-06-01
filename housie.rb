def housie()
  begin
    a=1
    b=9
    c=[]
    k=[1,2,3].repeated_combination(9).to_a
    s=Hash.new(0)
    k.each do |i|
      s[i]=i.sum if i.sum==15
    end
    e=rand(0..s.length-1)
    s=s.flatten
    s.delete(15)
    p=s[e]
    p.each do |i|
      w=[*a..b].sample(i)
      c<<w
      a=a+10
      b=b+10
    end
    c.map(&:sort!)
    for i in [*0..c.length-1]
      (3-c[i].length).times do |j|
        o=rand(0..2)
        c[i].insert(o,'--')
      end
    end
    c.map(&:compact!)
    d=c.transpose
    d.each do |i|
      if i.count('--')!=4
        raise
      end
    end
    d.each do |l|
      puts l.join(" ")
    end
  rescue
    retry
  end
end

housie()
