"""A example binary for the native Python rules of Bazel."""

import unittest

import numpy as np


class Test(unittest.TestCase):
    def test_numpy(self):
        a = np.array([1, 2, 3])
        b = np.array([1, 2, 3])
        self.assertEquals(np.dot(a, b), 14)


if __name__ == "__main__":
    unittest.main()
