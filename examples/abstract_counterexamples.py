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


    def test_m09_observational_agreement(self):
        world_a = {False: False, True: False}
        world_b = {False: False, True: True}
        self.assertEqual(world_a[False], world_b[False])
        self.assertNotEqual(world_a[True], world_b[True])

    def test_m09_worst_case_error(self):
        for d in range(1, 17):
            for r in range(d + 1):
                with self.subTest(d=d, r=r):
                    p = F(r, d)
                    self.assertEqual(p + (1 - p), 1)
                    self.assertGreaterEqual(max(p, 1 - p), F(1, 2))

    def test_m05_conditioning_amplification(self):
        for d in range(2, 17):
            for e in range(1, d):
                with self.subTest(d=d, e=e):
                    eps = F(e, d)
                    p = (1 - eps, eps, F(0))
                    q = (1 - eps, F(0), eps)
                    self.assertEqual(sum(p), 1)
                    self.assertEqual(sum(q), 1)
                    self.assertEqual(sum(abs(a - b) for a, b in zip(p, q)) / 2, eps)
                    p_event, q_event = sum(p[1:]), sum(q[1:])
                    self.assertEqual((p_event, q_event), (eps, eps))
                    p_cond = tuple(a / p_event for a in p[1:])
                    q_cond = tuple(b / q_event for b in q[1:])
                    self.assertEqual((p_cond, q_cond), ((1, 0), (0, 1)))
                    self.assertEqual(sum(abs(a - b) for a, b in zip(p_cond, q_cond)) / 2, 1)

    def test_m11_bernoulli_separation(self):
        for m in range(2, 33):
            for t in range(1, m // 2 + 1):
                with self.subTest(m=m, t=t):
                    delta = F(t, 2 * m)
                    p = (F(1, 2) + delta, F(1, 2) - delta)
                    q = (F(1, 2) - delta, F(1, 2) + delta)
                    self.assertEqual(sum(p), 1)
                    self.assertEqual(sum(q), 1)
                    self.assertLess(q[0], F(1, 2))
                    self.assertGreater(p[0], F(1, 2))
                    self.assertNotEqual(p, q)
                    self.assertEqual(sum(abs(a - b) for a, b in zip(p, q)) / 2, 2 * delta)


    def test_m05_horizon_gap(self):
        from itertools import product
        for d in range(2, 7):
            for e in range(1, d):
                eps = F(e, d)
                for h in range(7):
                    words = list(product((0, 1), repeat=h))
                    zero = (0,) * h
                    p = [F(word == zero) for word in words]
                    q = [eps ** sum(word) * (1 - eps) ** (h - sum(word))
                         for word in words]
                    self.assertEqual(sum(q), 1)
                    self.assertEqual(sum(abs(a - b) for a, b in zip(p, q)) / 2,
                                     1 - (1 - eps) ** h)

    def test_m07_balanced_likelihood(self):
        previous = F(0)
        for k in range(21):
            a = F(3, 5) ** k * F(2, 5) ** k
            b = F(4, 5) ** k * F(1, 5) ** k
            self.assertGreater(b, 0)
            self.assertEqual(a / b, F(3, 2) ** k)
            posterior = a / (a + b)
            self.assertGreater(posterior, previous)
            previous = posterior
        self.assertEqual(abs(F(3, 5) - F(1, 2)), F(1, 10))

    def test_m13_parity_identified_grid(self):
        # Enumerate all even-face count compositions for each denominator.
        for m in range(1, 17):
            compatible = set()
            for two in range(m + 1):
                for four in range(m - two + 1):
                    six = m - two - four
                    p = tuple(F(x, 2 * m) for x in (m, two, 0, four, 0, six))
                    self.assertEqual(sum(p), 1)
                    self.assertEqual(sum(p[1::2]), F(1, 2))
                    compatible.add(p[1])
            self.assertEqual(compatible, {F(u, 2 * m) for u in range(m + 1)})

    def test_m13_endpoint_identified_set(self):
        for m in range(2, 17):
            laws = [(m, 0, 0, m, 0, 0), (m, m, 0, 0, 0, 0)]
            p = [tuple(F(x, 2 * m) for x in law) for law in laws]
            self.assertTrue(all(sum(v) == 1 and sum(v[1::2]) == F(1, 2) for v in p))
            self.assertEqual({v[1] for v in p}, {F(0), F(1, 2)})
            self.assertNotIn(F(1, 2 * m), {v[1] for v in p})

    def test_m15_sampling_variance(self):
        from itertools import product
        for p in (F(1, 4), F(1, 2), F(3, 4)):
            for n in range(1, 9):
                weighted = [(F(sum(word), n),
                             p ** sum(word) * (1 - p) ** (n - sum(word)))
                            for word in product((0, 1), repeat=n)]
                self.assertEqual(sum(w for _, w in weighted), 1)
                self.assertEqual(sum(x * w for x, w in weighted), p)
                self.assertEqual(sum((x - p) ** 2 * w for x, w in weighted),
                                 p * (1 - p) / n)
        self.assertEqual(F(1, 2) - F(0), F(1, 2))


    def test_m01_prior_odds(self):
        for p in range(1, 8):
            for q in range(1, 8):
                for l in range(1, 5):
                    prior = (F(p, p + q), F(q, p + q))
                    likelihood = F(l, 5)
                    updated = tuple(x * likelihood for x in prior)
                    post = tuple(x / sum(updated) for x in updated)
                    self.assertEqual(post, prior)
                    self.assertEqual(post[0] / post[1], F(p, q))

    def test_m01_squared_risk_lower_bound(self):
        from itertools import product
        for a, b in product(range(5), repeat=2):
            for x, y in product(range(7), repeat=2):
                for p in (F(1, 4), F(1, 2), F(3, 4)):
                    ra = p * (x - a) ** 2 + (1 - p) * (y - a) ** 2
                    rb = p * (x - b) ** 2 + (1 - p) * (y - b) ** 2
                    self.assertGreaterEqual(max(ra, rb), F((a - b) ** 2, 4))

    def test_m06_total_variance(self):
        groups = [
            ((F(1, 3), F(2, 3)), (F(1, 4), F(3, 4))),
            ((F(0), F(2), F(5)), (F(1, 6), F(2, 6), F(3, 6))),
            ((F(7),), (F(1),)),
        ]
        weights = (F(1, 5), F(3, 5), F(1, 5))
        means = [sum(x * p for x, p in zip(xs, ps)) for xs, ps in groups]
        grand = sum(w * m for w, m in zip(weights, means))
        total = sum(w * sum(p * (x - grand) ** 2 for x, p in zip(xs, ps))
                    for w, (xs, ps) in zip(weights, groups))
        within = sum(w * sum(p * (x - m) ** 2 for x, p in zip(xs, ps))
                     for w, m, (xs, ps) in zip(weights, means, groups))
        between = sum(w * (m - grand) ** 2 for w, m in zip(weights, means))
        self.assertEqual(total, within + between)
        raw = sum(w * sum(p * x ** 2 for x, p in zip(xs, ps))
                  for w, (xs, ps) in zip(weights, groups))
        mean_sq = sum(w * m ** 2 for w, m in zip(weights, means))
        self.assertEqual(raw - grand ** 2, (raw - mean_sq) + (mean_sq - grand ** 2))
        self.assertGreaterEqual(raw, mean_sq)
        self.assertGreaterEqual(mean_sq, grand ** 2)

    def test_m08_intersection_bounds(self):
        from itertools import product
        for both, a, b, neither in product(range(4), repeat=4):
            total = both + a + b + neither
            if not total:
                continue
            p, q, intersection = F(both + a, total), F(both + b, total), F(both, total)
            self.assertLessEqual(max(F(0), p + q - 1), intersection)
            self.assertLessEqual(intersection, min(p, q))

    def test_m10_midpoint_sharpness(self):
        from itertools import product
        for a, b in product((F(0), F(1, 3), F(1), F(7, 3)), repeat=2):
            midpoint = (a + b) / 2
            self.assertEqual((midpoint - a) ** 2, (a - b) ** 2 / 4)
            self.assertEqual((midpoint - b) ** 2, (a - b) ** 2 / 4)

    def test_m14_finite_tv_contraction(self):
        from random import Random
        rng = Random(714)
        for _ in range(150):
            n, m = rng.randint(1, 6), rng.randint(1, 5)
            p_raw = [rng.randint(1, 8) for _ in range(n)]
            q_raw = [rng.randint(1, 8) for _ in range(n)]
            p = [F(x, sum(p_raw)) for x in p_raw]
            q = [F(x, sum(q_raw)) for x in q_raw]
            k = []
            for _ in range(n):
                raw = [rng.randint(1, 8) for _ in range(m)]
                k.append([F(x, sum(raw)) for x in raw])
            pk = [sum(p[i] * k[i][j] for i in range(n)) for j in range(m)]
            qk = [sum(q[i] * k[i][j] for i in range(n)) for j in range(m)]
            self.assertEqual(sum(pk), 1)
            self.assertEqual(sum(qk), 1)
            self.assertLessEqual(sum(abs(a - b) for a, b in zip(pk, qk)),
                                 sum(abs(a - b) for a, b in zip(p, q)))
        # Include a channel with zero weights and noninjective deterministic rows.
        p, q = (F(1), F(0)), (F(0), F(1))
        k = ((F(0), F(1)), (F(0), F(1)))
        self.assertEqual(tuple(sum(p[i] * k[i][j] for i in range(2)) for j in range(2)),
                         tuple(sum(q[i] * k[i][j] for i in range(2)) for j in range(2)))


if __name__ == "__main__":
    unittest.main(verbosity=2)
