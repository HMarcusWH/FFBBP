"""Fixed textbook-style counterexamples accompanying mathematics/FOUNDATIONS.md.

Run: python examples/abstract_counterexamples.py
These exact arithmetic checks concern only the stated toy experiments.
They are not a general proof, inference implementation, or empirical evaluation.
"""

from collections import Counter
from fractions import Fraction as F
import unittest


class AbstractCounterexamples(unittest.TestCase):
    def test_m02_finite_horizon_agreement(self):
        word = (0, 0, 1, 1)
        pairs = Counter((word[i], word[(i + 1) % 4]) for i in range(4))
        triples = Counter(
            (word[i], word[(i + 1) % 4], word[(i + 2) % 4])
            for i in range(4)
        )
        self.assertEqual(Counter(word), {0: 2, 1: 2})
        self.assertEqual(pairs, {(0, 0): 1, (0, 1): 1, (1, 0): 1, (1, 1): 1})
        self.assertEqual(F(triples[(0, 0, 0)], 4), 0)
        self.assertEqual(F(1, 2) ** 3, F(1, 8))

    def test_m04_present_statistic_is_not_future_law(self):
        reduced = {"A": 0, "B": 0, "C": 1}
        successor = {"A": "A", "B": "C", "C": "C"}
        self.assertEqual(reduced["A"], reduced["B"])
        self.assertNotEqual(reduced[successor["A"]], reduced[successor["B"]])

    def test_m05_equal_means_do_not_imply_equal_laws(self):
        p = (F(0), F(1), F(0))
        q = (F(1, 2), F(0), F(1, 2))
        self.assertEqual(sum(p), 1)
        self.assertEqual(sum(q), 1)
        self.assertEqual(sum(i * v for i, v in enumerate(p)), 1)
        self.assertEqual(sum(i * v for i, v in enumerate(q)), 1)
        self.assertEqual(sum(abs(a - b) for a, b in zip(p, q)) / 2, 1)

    def test_m08_overlapping_events(self):
        a, b = {2, 4, 6}, {4, 5, 6}
        self.assertEqual(F(len(a), 6), F(1, 2))
        self.assertEqual(F(len(b), 6), F(1, 2))
        self.assertEqual(F(len(a & b), 6), F(1, 3))
        self.assertEqual(F(len(a | b), 6), F(2, 3))
        self.assertEqual(F(len({1, 2, 3, 4, 5, 6} - (a | b)), 6), F(1, 3))

    def test_m14_parity_erases_distinguishability(self):
        p = (F(1, 2), F(1, 2), F(0), F(0), F(0), F(0))
        q = (F(0), F(0), F(1, 2), F(1, 2), F(0), F(0))
        self.assertEqual(sum(p), 1)
        self.assertEqual(sum(q), 1)
        self.assertEqual(sum(abs(a - b) for a, b in zip(p, q)) / 2, 1)
        self.assertEqual((sum(p[::2]), sum(p[1::2])), (F(1, 2), F(1, 2)))
        self.assertEqual((sum(q[::2]), sum(q[1::2])), (F(1, 2), F(1, 2)))

    def test_m16_equal_aggregate_distinct_components(self):
        a = [(F(1, 2), F(1, 2))]
        b = [(F(1), F(0)), (F(0), F(1))]
        for points in (a, b):
            self.assertTrue(all(u + v == 1 for u, v in points))
            self.assertEqual(sum(u for u, v in points) / len(points), F(1, 2))
            self.assertEqual(sum(v for u, v in points) / len(points), F(1, 2))
        self.assertEqual(sum((u - F(1, 2)) ** 2 for u, v in a), 0)
        self.assertEqual(sum((u - F(1, 2)) ** 2 for u, v in b) / 2, F(1, 4))
        self.assertEqual(sum((u - F(1, 2)) * (v - F(1, 2)) for u, v in a), 0)
        self.assertEqual(sum((u - F(1, 2)) * (v - F(1, 2)) for u, v in b) / 2, -F(1, 4))
        self.assertTrue(all(u == v for u, v in a))
        self.assertTrue(all(u != v for u, v in b))


if __name__ == "__main__":
    unittest.main(verbosity=2)
