file = io.input("test001.txt")    -- 使用 io.input() 函数打开文件

repeat
    line = io.read()            -- 逐行读取内容，文件结束时返回nil
    if nil == line then
        break
    end
    print(line)
until (false)

io.close(file)