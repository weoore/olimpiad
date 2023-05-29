using System;
using System.IO;
using System.Collections;

class Program
{
    static void Main()
    {
        var file = new StreamReader("Input.txt");
        var count_words = int.Parse(file.ReadLine());
        var arr = new ArrayList();
        for (int i = 0; i < count_words; i++)
        {
            arr.Add(file.ReadLine());
        }
        Func(file, int.Parse(file.ReadLine()), arr, 0);
        Func(file, int.Parse(file.ReadLine()), arr, arr.Count - 1);
        var output = new StreamWriter("Output.txt");
        output.WriteLine(arr.Count);
        file.Close();
        output.Close();
    }

    static void Func(StreamReader file, int count, ArrayList arr, int num)
    {
        for (int i = 0; i < count; i++)
        {
            var some_arr = file.ReadLine().Split(" ");
            var usl = int.Parse(some_arr[1]);
            for (int some = 0; some < arr.Count; some++)
            {
                if (arr[some].ToString()[num] == Convert.ToChar(some_arr[0]))
                {
                    usl -= 1;
                    if (usl < 0)
                        arr.RemoveAt(some);
                }
            }
        }
    }
}
