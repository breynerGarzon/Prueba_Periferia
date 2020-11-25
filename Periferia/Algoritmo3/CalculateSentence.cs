namespace Periferia.Algoritmo3
{
    public class CalculateSentence
    {
        private string OriginalSentence { get; set; }
        private string ReverseSentence { get; set; }
        public CalculateSentence(string sentence)
        {
            this.OriginalSentence = sentence;
            this.CalculateReverseSentence();
        }

        private void CalculateReverseSentence()
        {
            string[] sentence = this.OriginalSentence.Split(' ');
            for (int word = sentence.Length-1; word >= 0; word--)
            {
                string space = " ";
                if (word == 0)
                {
                    space = "";
                }
                this.ReverseSentence += $"{sentence[word]}{space}";
            }
        }

        public string GetReverseSentence()
        {
            return this.ReverseSentence;
        }
    }
}