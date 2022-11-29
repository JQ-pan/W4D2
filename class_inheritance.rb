class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end

    # def set_boss=(boss)
    #     @boss = boss
    #     @boss.add_employee(self)
    # end

    def inspect
        @name
    end

end

class Manager < Employee

    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def add_employee(employee)
        @employees << employee
    end

    # def all_employees
        
    # end

    def bonus(multiplier)
        salaries = 0
        
        @employees.each do |ele|
            # p ele
            # p ele.salary
            if ele.is_a?(Manager)
                salaries += ele.salary
                salaries += ele.bonus(1) 
            else
                salaries += ele.salary
            end
        end
        return salaries * multiplier

        # if @employees.length == 0
        #     return @salary *= multiplier
        # else
        #     return salaries * multiplier
        # end
    end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

ned.add_employee(darren)
darren.add_employee(shawna)
darren.add_employee(david)

p ned.bonus(5)        # 500_000
p darren.bonus(4)     # 88_000
p david.bonus(3)      # 30_000